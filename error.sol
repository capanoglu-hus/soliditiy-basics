//SPDX-License-Identifier:MIT 

pragma solidity ^0.8.7;

contract Errors{

    uint256 public totalBalances ;
    mapping(address => uint256 ) public userBalances;

    error ExceddingAmount(address user , uint256 ExceddingAmount);
    error Deny(string reason);

    receive() external payable{
        revert Deny("no direct payments");
    }

    fallback() external payable{
        revert Deny("no direct payments");
    }

    function pay() noZero(msg.value) external payable {
       
        require(msg.value == 1 ether, " only payments 1 ether" );

        totalBalances += 1 ether ; //1e18
        userBalances[msg.sender] += 1 ether;

    }
    function withdraw(uint256 _amount) noZero(_amount) external {
         uint256 initalBalances =  totalBalances ;
        if(userBalances[msg.sender] < _amount){
            revert ExceddingAmount(msg.sender , _amount - userBalances[msg.sender]);
        }
        totalBalances -= _amount;
        userBalances[msg.sender] -= _amount;
        // address => address payable  
        payable(msg.sender).transfer(_amount); //deger gönderme olduğu için adres payableya olmalı 

        assert(totalBalances < initalBalances); // genelde test aşamasında kullanılır 


    }

    modifier noZero(uint256 _amount ){
        require(_amount != 0);
        _;
    }
}