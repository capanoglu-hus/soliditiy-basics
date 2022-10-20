//SPDX-License-Identifier:MIT 

pragma solidity ^0.8.7;

struct Student{ //bir nesne oluşturuldu 
    string Name ; 
    uint8 age ;
    uint16 score;
}

contract StudentA{
    uint256 totalStudent = 0 ; //storage 
    mapping(uint256 => Student) students; //storage studentsleri bir id verildi 

    function addstudent(string calldata Name , uint8 age , uint16 score ) external {
        uint256 currentId = totalStudent ++ ; //total ögrenci artınca id de artıyor 
        students[currentId] = Student(Name, age ,score); 
    }

    function changeStudentInfoStorage(  // storage da yapılan değişikleri gösteriyor
        uint256 id , 
        string calldata newName , 
        uint8 newage , 
        uint16 newscore) 
        external {
        Student storage currentStudents = students[id] ;
       currentStudents.Name= newName;
        currentStudents.age= newage;
       currentStudents.score= newscore;


}

    function changeStudentInfomemory(  // memory da yapılan değişikleri gösteriyor
        uint256 id , 
        string calldata newName , 
        uint8 newage , 
        uint16 newscore) 
        external {
        Student memory currentStudents = students[id] ;
        currentStudents.Name= newName;
        currentStudents.age= newage;
        currentStudents.score= newscore;


} 
    function getStudent(uint256 id) external view returns (string memory){
        return students[id].Name; //ögrenci idsini veriyor 
    }

}