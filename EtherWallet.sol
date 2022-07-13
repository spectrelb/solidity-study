//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract EtherWallet {
    address payable public owner;

     constructor() {
        owner = payable(msg.sender); 
    }

    receive() external payable{}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "not owner");
        (bool res,) = payable(msg.sender).call{value:_amount}("");
        require(res, "Fail to send");
    }

    function getBalance() external view  returns(uint) {
        return address(this).balance;
    }
}