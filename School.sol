// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Library {
    /*
 Create a smart contract that showcases various exemplary scenarios by 
 utilizing nested structs and mappings within a primary struct. 
 Within the main struct, integrate a secondary struct, and within this secondary struct, 
 establish a mapping that links it to another struct. 
 Moreover, incorporate an enumeration declaration within the main struct. 
 Conclude by implementing a function that allows for the retrieval of information 
 from the deepest nested struct."


In the above task  there are  total of 3 structs you are working with


*/

    struct School {
        //struct
        string name;
        SchoolType schoolType; // enum
        Department dept; //struct
    }

    enum SchoolType {
        Federal,
        State,
        Private
    }

    struct Department {
        string nameS;
        uint matric;
        mapping(uint => LecturerDetails) lecturer;
    }
    struct LecturerDetails {
        string nameD;
        string subject;
    }
    mapping(uint => School) _school;

    uint schoolCount;

    function setSchool(
        string memory _name,
        SchoolType _type,
        string memory _nameS,
        uint _matric,
        string memory _nameD,
        uint lecturerID,
        string memory _subject
    ) external {
        schoolCount++;

        School storage newSchool = _school[schoolCount];
        newSchool.name = _name;
        newSchool.schoolType = _type;
        newSchool.dept.nameS = _nameS;
        newSchool.dept.matric = _matric;
        newSchool.dept.lecturer[lecturerID].nameD = _nameD;
        newSchool.dept.lecturer[lecturerID].subject = _subject;
    }

    function returnSchool(
        uint schoolCount_,
        uint lecturerID_
    ) external view returns (string memory, string memory) {
        string memory nameE = _school[schoolCount_]
            .dept
            .lecturer[lecturerID_]
            .nameD;
        string memory subjectT = _school[schoolCount_]
            .dept
            .lecturer[lecturerID_]
            .subject;
        return (nameE, subjectT);
    }
}
