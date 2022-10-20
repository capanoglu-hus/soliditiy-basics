//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract array{

    uint[6] dizi = [uint(10) , 20 , 30 , 40 , 50 , 60 ]; // uint oldugu için - olamaz 

    function dizi_ornek() public view returns(int[5] memory,uint[6] memory) {
        int[5] memory dizi2 = [int(35) , -50 , 24 , -65, 30 -22]; // intte - degerler alabilir 

   
    return (dizi2 , dizi);
    }


    uint uzunluk = 8 ;
    uint[] dizi3 = new uint[](uzunluk);

    function dizi_example() public returns(uint[] memory ){
       uint i ;

        for( i=0 ; i<uzunluk; i++){
            dizi3[i]=i ; 
        }
        return (dizi3);
    }  

 }