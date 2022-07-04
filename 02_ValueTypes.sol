//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract ValueTypes {
    // 布尔类型
    bool public _bool = true;

    //布尔值运算逻辑（!， &&， ||， ==， !=）
    bool public _bool1 = !_bool;
    bool public _bool2 = _bool && _bool1;
    bool public _bool3 = _bool || _bool1;
    bool public _bool4 = _bool == _bool1;
    bool public _bool5 = _bool != _bool1;


    //整型
    int public _int = 123;
    uint public _uint = 123;
    uint256 public _number = 123;

    /**
    常用的整型运算符
    比较运算符（返回布尔值）： <=， <， ==， !=， >=， >
    算数运算符： +， -， 一元运算 -， +， *， /， %（取余），**（幂）
     */
    uint256 public _number1 = _number + 1; // +，-，*，/
    uint256 public _number2 = 2**2; // 指数
    uint256 public _number3 = 7 % 2; // 取余数
    bool public _numberbool = _number2 > _number3; // 比大小

    //地址类型
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;

    // 可转账的eth地址，拥有balance和tranfer()两个成员，方便查询ETH余额以及转账
    address payable public _addr = payable(_address);
    // 可转账地址类型的成员
    uint256 public balance = _addr.balance;

    /**
    定长字节数组
    hello web3变量以字节的方式存储进变量_byte32，
    转换成16进制为：0x68656c6c6f207765623300000000000000000000000000000000000000000000
    _byte变量存储_byte32的第一个字节，为0x68。
     */
    bytes32 public _byte32 = "hello web3";
    bytes1 public _byte1 = _byte32[0];

    //枚举
    enum ActionSet { Buy, Sell}
    ActionSet actionSet = ActionSet.Buy;
}