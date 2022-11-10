//SPDX-License-Identifier:MIT 

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TaxToken is ERC20 {

    uint256 taxDis = 10 ; // vergi olarak alacagı  

    constructor () ERC20("TaxToken" , "TT") {
        
        //ERC20 parametreleri 
    }

    function mintTo(uint256 amount) public {
        _mint(msg.sender , amount);

        // tutar ve gönderilen yer 
    }

    function transfer(address to , uint256 amount) public override returns(bool){
        //erc20 olan kont. transfer fonk. degiştirecegiz 

        uint256 senderBalance = balanceOf(msg.sender);
        require(senderBalance >= amount , "ERC20: not enough balance for amount ");

        uint256 taxAmount = amount / taxDis ; //tutarın 10da birini aldı 
        uint256 transferBa = amount - taxAmount ; // tutardan çıkarıp geri ne kadar transfer edeceği kaldı 

       _transfer(msg.sender , to , transferBa);
       _transfer(msg.sender , address(0) , taxAmount);

       

        return true; 
    }

}

