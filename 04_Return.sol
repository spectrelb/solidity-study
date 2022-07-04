//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract Return {
    /**
    Solidity有两个关键字与函数输出相关：return和returns，他们的区别在于：
    1.returns加在函数名后面，用于声明返回的变量类型及变量名；
    2.return用于函数主体中，返回指定的变量。
     */
    function returnMultiple() public pure returns(uint256,uint256, string memory) {
        return (1, 2, "string");
    }

    // 可以在returns中标明返回变量的名称，这样solidity会自动给这些变量初始化，并且自动返回这些函数的值，不需要加return。
    function returnNamed() public pure returns(uint256 _number, bool _bool, string memory _string){
        _number = 2;
        _bool = false; 
        _string = "string";
    }

     function returnNamed2() public pure returns(uint256 _number, bool _bool, string memory _string){
        return (1, false, "string");
    }

    function get() public pure {
        //读取所有返回值：声明变量，并且将要赋值的变量用,隔开，按顺序排列。
        uint256 _number;
        bool _bool;
        string memory _string;
        (_number, _bool, _string) = returnNamed();

        //读取部分返回值：声明要读取的返回值对应的变量，不读取的留空。
        bool _bool2;
        (, _bool2, ) = returnNamed();
    }
}