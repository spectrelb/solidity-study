//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract ReceiveAndFallback {
    /**
        receive()只用于处理接收ETH。一个合约最多有一个receive()函数
        当合约接收ETH的时候，receive()会被触发。gas会限制在2300，receive()太复杂可能会触发Out of Gas报错；
        receive() external payable {}
     */
    event Received(address sender, uint256 value);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    /**
        fallback()函数会在调用合约不存在的函数时被触发
     */
    event fallbackCalled(address sender, uint256 value, bytes Data);

    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }

    /**
    receive和fallback的区别
    触发fallback() 还是 receive()?
                接收ETH
                    |
                msg.data是空？
                    /  \
                是    否
                /      \
        receive()存在?   fallback()
                / \
            是  否
            /     \
        receive()   fallback()
    简单来说，合约接收ETH时，msg.data为空且存在receive()时，会触发receive()；
    msg.data不为空或不存在receive()时，会触发fallback()，此时fallback()必须为payable。
receive()和payable fallback()均不存在的时候，向合约发送ETH将会报错。
     */
}