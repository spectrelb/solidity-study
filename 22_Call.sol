//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract OtherContract {
    uint256 private _x = 0;

    event Log(uint amount, uint gas);

    fallback () external payable{}
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setX(uint256 x) external payable {
        _x = x;
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns(uint x) {
        x = _x;
    }
}

contract Call {
    // 定义Response事件，输出call返回的结果success和data
    event Response(bool success, bytes data);

    
}