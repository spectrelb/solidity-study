

//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

import './13_Inheritance.sol';

contract Import {
    // 声明yeye变量
    Yeye yeye = new Yeye();

    // 测试是否能调用yeye的函数
    function test() external{
        yeye.hip();
    }
}