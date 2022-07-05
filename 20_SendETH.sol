//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

 //Solidity有三种方法向其他合约发送ETH，他们是：transfer()，send()和call()，其中call()是被鼓励的用法。

error SendFailed(string msg);
error CallFailed();


contract SendETH {
    
    constructor () payable {}

    receive() external payable {}

    //transfer有2300 gas限制，但是发送失败会自动revert交易，是次优选择；
    function transferEth(address payable _to, uint256 amount) external payable {
        _to.transfer(amount);
    }

    // send有2300 gas限制，而且发送失败不会自动revert交易，几乎没有人用它。只能自己添加error
    function sendEth(address payable _to, uint256 amount) external payable {
        bool success = _to.send(amount);
        if (!success) revert SendFailed('0xb1');
    }

    //call没有gas限制，最为灵活，是最提倡的方法；
    function callEth(address payable _to, uint256 amount) external payable {
        (bool success, ) = _to.call{value:amount}("");
        if (!success) revert CallFailed();
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract ReceiveETH {
   event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}   