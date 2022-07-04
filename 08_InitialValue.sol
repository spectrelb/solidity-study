//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract InitialValue {
    //在solidity中，声明但没赋值的变量都有它的初始值或默认值

    //值类型初始值
    bool public _bool; // false
    string public _string; // ""
    int public _int; // 0
    uint public _uint; // 0
    uint256 public _uint256; // 0
    address public _address; // 0x0000000000000000000000000000000000000000

    enum ActionSet { Buy, Hold, Sell}
    ActionSet public _enum; // 第一个元素 0

    function fi() internal{} // internal空白方程 
    function fe() external{} // external空白方程 

    //引用类型初始值

    // Reference Types
    uint[82] public _staticArray; // 所有成员设为其默认值的静态数组[0,0]
    uint[] public _dynamicArray; // `[]`
    mapping(uint => address) public _mapping; // 所有元素都为其默认值的mapping
    // 所有成员设为其默认值的结构体 0, 0
    struct Student{
        uint256 id;
        uint256 score; 
    }
    Student public student;
}