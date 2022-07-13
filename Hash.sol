//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract HashFunc {
 
    function hash(string calldata _string, uint num, address addr) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(_string,num, addr));
    }
}