//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract Constructor{ // başlangıçta çalışır fonksiyon gibi 

    string public tokenName;
    uint public totalSupply;

constructor(string memory name  , uint num) {
    tokenName = name; 
    totalSupply = num ; 

} 
function set(uint number) public {
    totalSupply= number ; // constructor'daki degişkenleri sadece böyle değiştirebilirsin 

} 
 // constant , immutable 
 //constant bir degişkeni atarsan bir daha degiştiremezsin 
 
//  string public constant  husniye ;

// //immutable sadece constructor ile degiştirelebilir .
//  uint8 public immutable tokenNum; 
//  constructor(uint8 numt  ){
//      tokenNum = numt ;
//  }

}