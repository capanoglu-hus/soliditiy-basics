//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract Struct{
    struct Kitap{
        string ad;
        string yazar;
        uint id;
        bool stok ; 
    }

    Kitap kitap1 ; 

    Kitap kitap2 = Kitap ("ideal",
                          "husniye" ,
                          23,
                          false);

    function set_kitap() public {
        kitap1 = Kitap("solidity" , "huso" , 33 , true);
    }

    function kitap_info() public view returns(string memory,string memory, uint, bool){
        return (kitap2.ad , kitap2.yazar , kitap2.id , kitap2.stok);
    }

    function get_detay() public view returns(string memory , uint){
        return(kitap1.yazar , kitap2.id);
    }
}