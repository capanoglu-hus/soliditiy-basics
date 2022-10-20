// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

contract Test{
    uint d = 5 ; // global deger

    function topla(uint c) public pure returns(uint){
        // pure olunca dışarıdan degişken kullanmıyor 
        // view olunca dışarıdan degişken kullanıyor 
        uint a = 1;
        uint b = 2;
        uint result = a + b + c ; // c degerini kullanıcı girebiliyor 
        return result ;
    }

    function toplama() public view returns(uint){
        uint s= 3; // local deger
        uint h = 5 ;
        uint result2 = s + h + d ;
        return  result2 ;

    }

    function carp() public pure returns(uint){
        uint c = 10 ;
        uint f = topla(c)*c ;
        return f ;

    }
}
