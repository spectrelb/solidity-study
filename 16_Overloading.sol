//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract OverLoading {
    //solidity中允许函数进行重载（overloading），即名字相同但输入参数类型不同的函数可以同时存在，他们被视为不同的函数。注意，solidity不允许修饰器（modifier）重载。

    function saySomething() public pure returns(string memory){
        return("Nothing");
    }

    function saySomething(string memory something) public pure returns(string memory){
        return(something);
    }
}