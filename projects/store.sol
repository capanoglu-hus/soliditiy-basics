// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Store{

    enum Status{
        Taken , // ---->0
        Prepating , // ---->1
        Boxed , // ---->2
        Shipped // ---->3
    }

    struct Order{
        address customer; // adrese baglı müsteri 
        string zipCode; // posta kodu 
        uint256[] products; // ürünleri dizide tutuyoruz 
        Status status ; 
    }

    Order[] public orders ;//bir stack-array oluşturmuş olacaz 
    address public owner ; // 

    constructor(){
        owner = msg.sender ; 
        // kont. oluşturan kişi magaza yönetici oluyor 
    }

    function createOrder(string memory _zipCode, uint256[] memory _products ) external returns (uint256 ){
        require(_products.length > 0 ," not products") ;

        Order memory order ; //bir kopyasını oluşturuyoruz 
        order.customer = msg.sender ; // gönderen kişi olmalı 
        order.zipCode = _zipCode ;
        order.products = _products ; 
        order.status = Status.Taken;
        // oluşturulan kopyayı array e ekliyerek blokzincire kaydetmiş olduk
        orders.push(order) ; 
        return orders.length - 1 ; 
    } 
    //sipariş durumlarını ilerletecek bir fonk.
    function advanceOrder(uint256 order_id ) external {
        require(owner == msg.sender , " you not owner ") ; 
        require(order_id < orders.length , "not a valid order id  ") ; 
        Order storage order = orders[order_id] ; // order tipinin degişkenini ifade ediyor daha sonra olmaya devam edecek 
        require(order.status != Status.Shipped , "order is already  shipped ");

        if(order.status == Status.Taken){
            (order.status = Status.Prepating);
        }else if(order.status == Status.Prepating){
            (order.status = Status.Boxed);
        }else if (order.status == Status.Boxed){
            (order.status = Status.Shipped);
        }
    }

    function getOrder(uint256 order_id) external view returns(Order memory){
        require(order_id < orders.length , "not a valid order id  ") ; 
        
        return orders[order_id] ;

    }

    function uploadzip(uint256 order_id , string memory _zip) external {
        require(order_id < orders.length , "not a valid order id  ") ; 
        Order storage order = orders[order_id] ;
        require(order.customer == msg.sender , " you  not owner of the order");
        order.zipCode = _zip ;  

    } 
}