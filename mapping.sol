//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7 ;

contract map{
    mapping(address => bool) public registered ; //kayıtlı olup olmadıgı true-false döndürecek 
    mapping(address => int256) public favNum ; // favNu sayı olarak döndürecek 

    function register(int256 _favNum ) public {
        require(!isRegistered() , "kullanici kayitli degil"); // ! ile kayıtlı olmadıgına true dönüyor 
        registered[msg.sender] = true ;
        favNum[msg.sender] = _favNum ; // favnum çagırıyor eger kayıtlıysa 
    }

    function isRegistered() public view returns(bool){
        return registered[msg.sender] ; // yukarıdaki fon. bunu kontrol etmiş olacak 
    }

    function deleteRegistered() public {
        require(isRegistered(),"kullanici kayit degil"); //olmayan kullanıcıyı silemezsin 
        delete(registered[msg.sender]); 
        delete(favNum[msg.sender]); 
    }

} 

contract NestedMapping{ 
    mapping(address => mapping(address => uint256)) public debts ; 

    function incdebts(address _borrower , uint256 _amount) public {
        debts[msg.sender][_borrower] += _amount; // iki key degerini beraber kullandık 
    } 

    function decdebts(address _borrower , uint256 _amount) public {
        require(debts[msg.sender][_borrower] >= _amount , "not debt "); // borç çıkarmak istediginden küçükse hata verir . 
        debts[msg.sender][_borrower] -= _amount;
    }

    function getdebt(address _borrower ) public view returns(uint256){
         return debts[msg.sender][_borrower] ; 
    }    
}