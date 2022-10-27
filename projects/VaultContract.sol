// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract VaultConract{

    struct Vault{
        address creator;
        string name ;
        address[] users;
        uint256 amount ;
    }
    uint256 totalVault ;
    mapping(uint256 => Vault) public vaults;
    mapping(address => uint256) public balance;

    event VaultDistrubtion(uint256 vaultid , uint256 amount) ;

    function createVault( 
        string memory name ,
        address[] memory users ,
        uint256 initialAmount )
        public returns( uint256 vaultid){
          Vault storage vault = vaults[totalVault];   
            vault.creator = msg.sender ;
            vault.name = name ;
            vault.users = users;
            vault.amount = initialAmount ;
            totalVault += 1 ;
            return totalVault - 1 ;
        }

    function addAmount(uint256 vaultid , uint256 amount) public {
        Vault storage vault = vaults[vaultid]; 
        require (msg.sender == vault.creator , "not vault owner ") ; 
        vault.amount += amount ;
    }

    function distribute(uint256 vaultid) public {
        Vault storage vault = vaults[vaultid];
        uint256 amountPerUser = vault.amount / vault.users.length ; 
        if(vault.amount != 0 ){
            for (uint i ; i < vault.users.length ; i++){
            vault.amount -= amountPerUser ; 
            balance [vault.users [i]] = amountPerUser;
            }
        } else {
            revert("no funds available");
        } 
        emit VaultDistrubtion(vaultid , amountPerUser * vault.users.length);
    }
    
}
