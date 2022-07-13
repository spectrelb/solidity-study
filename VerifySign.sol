//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract VerifySign {
 
    function verify(string calldata _string, uint num, address addr) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(_string,num, addr));
    }
}