//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract ConstructorAndModifier {
    address public owner;
    constructor() {
        owner = msg.sender; // 在部署合约的时候，将owner设置为部署者的地址
    }

    modifier onlyOwner {
        require(msg.sender == owner); // 检查调用者是否为owner地址
        _;  //如果是的话，继续运行函数主体；否则报错并revert交易
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }
}