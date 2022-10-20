//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7 ; 

// contract A {
//     uint public x ;
//     uint public y ;
//     // virtual ---> yazılan fonk. içeriğini yeniden değiştirmeye izin vermek istiyorsan . 
//     function setX(uint _x) virtual public {
//         x = _x;
//     }

//     function setY(uint _y) virtual public {
//         y = _y;
//     }
// }

// contract B is A{ // is ---> miras almak için kullanılıyor
//     // x-y için a kontratından geliyor 
//     uint public z ;
//     function setZ(uint _z) public {
//         z = _z ;
//     }
//     // eger miras aldığın fonk. değiştirmek istiyorsan override olmalı 
//     // yazılan kontratta da virtual yazılmış olmalı
//     function setX(uint _x) override public {
//         x = _x + 2 ;
//     }
 
// }

// contract Human {
//     function sayHello() public pure virtual returns(string memory){
//         return "sol ogremeye calisiyorum";
//     }
// }
// // bu yazıyı mesela bazı kişilere göstermek istiyorum 
// contract SuperHuman is Human{
//    function sayHello() public pure override returns(string memory){
//        return "ogremeye basladim";
//    }
//     // isMember -->bir degişken 

//    function sayWelcome(bool isMember) public pure returns(string memory){
//        return isMember ? sayHello() : super.sayHello() ; //Human.sayHello() ;
//    }

// } 

// miras alırken eger başka bir yerde ise "import url " kullanılır .
// import nmp den olan paketlere yazabilirsin 

contract Wallet{

    fallback() payable external {} 

    function sendEther(address payable to , uint _amount) public {
        to.transfer(_amount);
    }

    function showBalance() public view returns(uint){
        return address(this).balance ;
    }
     // moditifier oldugunda eger kullanacaksan onu fonksiyonun tanım kısmına yazman lzım 
}