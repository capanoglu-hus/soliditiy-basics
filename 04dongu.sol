// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;

contract donguler {
    function dongu1() public pure returns(uint){
        uint a ; //local deger 
        uint toplama ; // local 
        for (a=0; a<10 ;a++ ){
            toplama +=a;

        }
        return toplama; 

    }

    uint topla ;

    function dongu2() public returns(uint){ // toplayı dısarıdan aldıgı için ve bu bir degiskene bir şey 
    // aktardığı için publicten sonra bir şey yazılmaz 
        uint a ;
        for (a=0; a<10 ; a++){
            topla +=a ;
        }
        return topla ; 
    }
    // özel bir view olduğu için terminal tarafından görüntülenir
     
     uint[] data ;
     uint8 i = 0; 
    
    function whileLoop() public returns(uint[] memory){
        while (i<5){
            i++;
            data.push(i);

        }

        return data ;

    }
}
 