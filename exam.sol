//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7 ; 

contract exam{
    uint public  x= 15 ; // normalde olan sayı 15 iken 

    function Setx(uint newX) public { // fonlsyion sayesinde x degiştirdi . 
        x= newX ; 
    }

    uint a = 30 ; 

    function setY(uint y) public view returns(uint){
        return a+y ; 
    } 

    function addNumber(uint g ,uint b) public view returns(uint){
        return g + b + block.timestamp ; 
    }

    function add(uint f , uint v) public pure returns(uint){
        return f + v ; 
    } 

    function publicKeyword() public pure returns( string memory){
        return("bu bir public fonksiyon ") ; 
    }

    function callpublicKeyword() public pure returns( string memory){
        return publicKeyword(); 
    }
}