//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract ArrayAndStruct {
    
    //固定长度数组
    uint256[3] arrayLength3;
    bytes32[5] array2;
    address[100] array3;

    //可变长度数组
    uint[] array4;
    bytes32[] array5;
    address[] array6;

    function arrayPush() public returns(uint[] memory) {
        uint[3] memory a = [uint(1) ,2,3];
        array4 = a;
        array4.push(4);
        return array4;
    }

    //结构体
    struct Student {
        uint256 id;
        uint256 score;
    }

    Student student; // 初始化一个结构体

    //给结构体赋值方法一
    function initStudent1() external {
        Student storage _student = student;
        _student.id = 11;
        _student.score = 100;
    }

    function initStudent2() external {
        student.id = 11;
        student.score = 100;
    }
}