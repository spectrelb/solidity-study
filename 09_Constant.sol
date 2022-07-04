//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract ConstantAndImmutable {
    //状态变量声明这个两个关键字之后，不能在合约后更改数值；并且还可以节省gas
    //只有数值变量可以声明constant和immutable；string和bytes可以声明为constant，但不能为immutable。

    //constant变量必须在声明的时候初始化，之后再也不能改变。
    uint256 constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "web3";
    bytes constant CONSTANT_BYTES = "wen3";
    address constant CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000000;

    //immutable变量可以在声明时或构造函数中初始化，因此更加灵活。
    uint256 public immutable IMMUTABLE_NUM = 9999999999;
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    // 利用constructor初始化immutable变量
    constructor(){
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_BLOCK = block.number;
        IMMUTABLE_TEST = test();
    }

    function test() public pure returns(uint256){
        uint256 what = 9;
        return(what);
    }
}