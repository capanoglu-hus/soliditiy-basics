// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract VaultFactory{
    mapping( address => Vault[]) public userVaults ; 
    // bir akıllı kont. aracıyla başka bir akıllı kont. nasıl deploy edilir.
    function createVault() external {
        // o kullanıcıya özel bir vault oluşturdu .
        Vault vault = new Vault(msg.sender); // kont. degişken gibi alıp new ile 
        // constructor ile kullnıcı parametresi aldıgımı için ----> msg.sender 
        //gas harcaması çok fazla   
        userVaults[msg.sender].push(vault);
    }

    function createVaultwithpayment() external payable{
        // fonk. para gelecek  --- balance yatırmka için constructora payable demen kazım 
        Vault vault = (new Vault){value : msg.value}(msg.sender);
        userVaults[msg.sender].push(vault);

    }
}

contract Vault{
    address public owner; // constructora parametre almak zorunda 
    uint256 private balance ;

    constructor( address _owner ) payable{
        owner = _owner ; 
        balance += msg.value ;
    }
    fallback() external payable{
        // revert(); parayı direkt kabul etmiyor 
         balance += msg.value ; // kont. gelen parayı balance ekliyor 
    }

    function getBalance() external view returns( uint256){
        return address(this).balance ;
    }

    function deposit() external payable{
        balance += msg.value ; 

    }

    function withDraw(uint256 _amount) external {
        
        require(msg.sender == owner , "you not ");
        balance -= _amount ; 
        // kont. ownerına çekmek istenilen miktarı transfer ediyor 
        payable(owner).transfer(_amount) ; 
    }
}
