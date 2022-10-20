// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7 ;

contract ifelse {

    function kosul(uint x) public pure returns(uint){
        if(x<10){
            return 0; 
        } else if (x<20) {
            return 1 ; 
        } else {
        return 2 ;
        }
    } 

     // uint degeri kullanılıdıgı için degerlere eksi girilemez hata verir. 

    function kosul2(uint y )  public pure returns(uint8){

        return y<10 ? 1 : 2 ; // if(y<10){ return 1 } else {return 2} 
    }
}
