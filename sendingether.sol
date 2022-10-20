//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7 ; 

contract  Bank{

    mapping(address => uint ) balances ; 
    // ether göndereceksen payable ile yazman lazım 
    function sendEtherToContract()  payable external {
        balances[msg.sender] = msg.value ; 
    }
    // yukarıdaki balances public yapmak istemedigimiz için
    function showBalance() external view returns(uint){
        return balances[msg.sender] ; 

    }
    // eger bir hesaba ether göndermek istiyorsak payable yazmamız lazım
    // fonk. için payable yukarıda yazılmalıyken , hesaplar için yanda yazılabilir 
    function withdraw( address payable to, uint amount) external returns(bool) { 
        //geri gidecek adresi tanımlamak için 
        // to adress yani kişi , amount ise gönderilecek tutar 
        //require(balances[msg.sender] >= amount , " not yet balances ");
        (bool sent,) = to.call{value:amount}("");
        balances[msg.sender] -= amount ; 
        return sent; 

    }
    //show balancesta etheri geri çekip hesaba geri dönderdiğimizde 
    //hesapta göörünüyor ama showbalancesta görünmüyor 
    // show balancesı geri göndermeden sonra güncellememiz lazım 
    
    //Transfer() ---> eger işlem olmazsa geri dönüyor .
    // send() -----> true , false işlemin gerçekleşip gerçekleşmedigini gösteriyor 
    //call() ------> yukarıda yapıldı. 

    //eger kontrata ether gelirse önceden tanımlanan 2 fonksion ile ne yapılacagı belirlenir
    uint public receiveCount= 0 ;
    receive() external payable {
        receiveCount ++ ; 
        //özel fonk . her calıştıgında artacak
    }    

    uint public fallbackCount= 0 ; 
    fallback() external payable{
        //data gönderirken kullanılır . 
        fallbackCount ++ ; 
    }


}