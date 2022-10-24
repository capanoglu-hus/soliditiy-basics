// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7; 

//dogrudan sadece bir eth için kullanılması 
// eger diger kont. fonk adını ve parametreleri kullanmaya yarıyor 
contract Test{
    uint public total= 0 ;
    uint public fallbackCount = 0; 
    string public incrementer ; 

    fallback() external payable{
        fallbackCount += 1 ;
    }

    function inc(uint256 _amount , string memory _incrementer ) external returns(uint256 ){
        total += _amount;
        incrementer = _incrementer ;

        return total;

    }

}

contract Caller{

    function testCall( address _contract , uint256 _amount , string memory _incrementer) external returns(bool , uint256) {
        (bool err , bytes memory res ) = _contract.call(abi.encodeWithSignature("inc(uint256 , string)", _amount , _incrementer)) ;
        //inc fonk. parametrelerini yazman lazım
        
        uint256 _total = abi.decode(res , (uint256)) ;  
        return (err , _total);


    }

    function payTofallback(address _contract) external payable{
       (bool err, )= _contract.call{value: msg.value }("");

        if(!err) revert() ;

        
    }

}