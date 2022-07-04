//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract Event {
    mapping(address => uint256) public _balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(address from, address to, uint256 amount) external {
        _balances[from] = 1000000;
        _balances[from] -= amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);
    }
}