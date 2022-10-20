//SPDX-License-Identifier:MIT 
pragma solidity ^0.8.7 ; 

contract exam{

    bytes32 private hashpassword;

    constructor( string memory  _password){
        hashpassword= keccak256(abi.encode(_password));

    }

    function login (string memory _password) public view returns(bool){
        if(hashpassword == keccak256(abi.encode(_password))){
            return true;
        } else {
            return false ; 
        }
    }
    }
