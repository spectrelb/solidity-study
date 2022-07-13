//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract PiggyBank {
    address public owner = msg.sender;

    event Deposit(uint amount);
    event WithDraw(uint amount);

    receive() external payable{
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        emit WithDraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
} 