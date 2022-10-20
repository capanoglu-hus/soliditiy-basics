//SPDX-License-Identifier:MIT 

pragma solidity ^0.8.7;

contract Interact{ 
    address public caller ;
    mapping(address => uint256) public  counts;
    function callThis() external {
        caller = msg.sender;
         // biri bu fonksiyonu cagırırsa caller -- msg.sender 
        counts[msg.sender] ++ ; // köseli parantez mapping oldugu için kaç defa çagrıldıgını görecez


    }
}

contract Pay{
    mapping(address => uint256 ) public userBalances;

    function payEth(address _payer) external payable{
        //balances in kimden geldigine bakmak için parametre atamalısın 
        userBalances[_payer] += msg.value ; // her gelen degerde userbalances bir artacak 
    }

}
// kontrat baska bir kont. cagrıyorsa 
//msg.sender --> a(mesajı yollanayan : msg.sender ) ---> b (mesajı yollayan : a)


contract Caller { 
    //aynı sol dosyasında oldugu için anlıyor 
    //farklı yerlerde olsaydı "import" kullanırdık

    //diger kontratlar için  degişkene tanımlamam ve hangi adreste oldugunu belirtmem 

    Interact interact ; // kontratı degişkene atadık .
    // kontrat adresi sürekli degişecegi için contructor ile yapaza
    constructor(address _interactConract){
        interact = Interact(_interactConract) ; 
    //deişkene kontratı kullanarak adreste bir konuşma oluyor 
    }

    function callInteract()  external {
        interact.callThis() ; //kontrattan çagırdı
    }

    function readCaller() external view returns(address){
        return interact.caller() ;
    }

    function readCallerCount() public view returns(uint256){
        return  interact.counts(msg.sender); //Metot cagrısı oluyor yani mapping degil
    }

    function payToPay(address _payAddress) public  payable {
        Pay pay = Pay(_payAddress) ; //nft de kullanılması çok 
        pay.payEth{value: msg.value}(msg.sender) ; //ether degeri dogrudan payeth fonk. cagrıracak
       
    } 

    function sendEth() public payable {
        payable(address(interact)).transfer(msg.value); // kont. hangi adreste diyoruz gibi 
        // bir kont. dogrudan eth alması için fallback ve receive olması lazım 
    }

} 