//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Ownable {
    address public owner;
    
    constructor () {
        owner = msg.sender;
    }   

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _new) external onlyOwner {
        require(_new != address(0), "not address");
        owner = _new;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {

    }

     function onlyOwnerCanCall() external {
        
    }
}