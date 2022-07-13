//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract Kill {
    constructor() payable {}
 
    function kill() external  {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns(uint) {
        return 123;
    }
}

contract Help {
    function kill (Kill _kill) external {
        _kill.kill();
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}