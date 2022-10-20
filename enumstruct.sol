//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract exam{

    enum Status{
        Taken, //0
        Prepating, //1
        Boxed, //2
        Shipped //3 
    }

    struct Order{
        address customer ;
        string zipCode;
        uint256[] products;
        Status status;
    }

    Order[] public orders; // gelenleri diziye attı 
    address public owner ; //

    constructor ()  { // kontratı oluşturan kişi owner olmuş olacak 
        owner = msg.sender ;

    }


    function createOrder(string memory _zipcode , uint256[] memory _products) external returns(uint256){
        require(_products.length > 0 , "not products") ; //0 dan büyük degilse ürün yoktur 

        Order memory order; //yukarıda yapılan Orderdan 
        // bir şey oluşturup ordera atacak
        order.customer = msg.sender;
        order.zipCode = _zipcode;
        order.products = _products ;
        order.status = Status.Taken ;

        orders.push(order) ; // memory kullanrak localda oluşturudgumuz 
        //orderı array e ekliyerek blokzincire kaydetmiş olduk .

        // orders.push(
        //     Order({
        //         customer = msg.sender,
        //         zipCode = _zipcode,
        //         products = _products,
        //         Status = Status.Taken

        //     })

        // );

        // orders.push(Order{msg.sender , _zipcode , _products , Status.Taken});

        return orders.length - 1 ; // ilk order gelince 1 olacak ama dizi olarak tuttudugumuz için 0 
        // olmalı bu yüzden çıkartıyoruz .

    } 
    function advanceOrder(uint256 _orderId) external view {
        require(owner== msg.sender , " you not owner ") ;
        require(_orderId < orders.length , "not a valid order");

        Order storage order = orders[_orderId] ;  //yapacagımız order olarak belirledik 
        require(order.status != Status.Shipped , "order is already shipped ");

        if(order.status == Status.Taken){
            order.status == Status.Prepating;
        } else if (order.status == Status.Prepating){
            order.status == Status.Boxed;
        } else if( order.status == Status.Boxed) {
             order.status == Status.Shipped;
        }
        
    }

    function getOrder(uint256 order_id) external view returns(Order memory){
        require(order_id < orders.length , "not order");
        return orders[order_id];


    }

    function uploadzip( string memory _zip , uint256  order_id ) external {
        require(order_id < orders.length , "not order");
        Order storage order = orders[order_id];
        require(order.customer == msg.sender , "you not customer ") ;
        order.zipCode = _zip ;

    }


}