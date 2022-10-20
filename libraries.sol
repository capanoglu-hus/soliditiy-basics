//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

// library Math{
//     function plus(uint256 x, uint256 y ) public pure returns(uint256){
//         return x+y ;
//     }
//      function minus(uint256 x, uint256 y ) public pure returns(uint256){
//         return x-y ;
//     }
//      function multi(uint256 x, uint256 y ) public pure returns(uint256){
//         return x*y ;
//     }
//      function divide(uint256 x, uint256 y ) public pure returns(uint256){
//         require(y != 0 , "sayiyi degistir");
//         return x/y ;
//     }

//     function min(uint256 x, uint256 y ) public pure returns(uint256){
//        if(x <= y ){
//            return x;
//        }else {
//            return y ;
//        }
//     }

//     function max(uint256 x, uint256 y ) public pure returns(uint256){
//        if(x >= y ){
//            return x;
//        }else {
//            return y ;
//        }
//     }
// }

// library Search{
//     function indexof(uint[] memory list , uint data  ) public pure returns(uint256){
//         for( uint i=0 ; i< list.length; i++){
//             if (list[i] == data){
//                 return i ;
//             }
//         }
//         return list.length ;
//     }
// }
// contract Libraries{

//     function trial1(uint256 x ,uint256 y ) public pure returns(uint256){
//         return Math.plus(x,y);
//     }

//      function trial3(uint[] memory x ,uint y ) public pure returns(uint256){
//         return Search.indexof(x,y);
//     }

//     using Math for uint ;
//     function trial2(uint256 x ,uint256 y ) public pure returns(uint256){
//         return x.minus(y);
//     }   
// } 

library Human {

    struct Person{
        uint age ; 
    }

    function birthday(Person storage _person) public {
        _person.age += 1 ; 
    } 

    function showAge(Person storage _person) public view returns(uint){
        return _person.age;
    } 
}

contract HumanContract{
    // mapping kullanma sebebi herbir insana id vermek için gibi
    mapping(uint => Human.Person) people;

    function NewYear() public {
        Human.birthday(people[0]); // peoplelara id verdşgim için 0. indexte olanaı aldım gibi
        // human.birthday ---> kütüphaneden 
        // people[0] ---> mapping den geliyor
    }
    function show() public view returns(uint){
        return   Human.showAge(people[0]);
    }
}