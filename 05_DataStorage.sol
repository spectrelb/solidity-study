//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract DataStorage {
    /**
    solidity数据存储位置有三类：storage，memory和calldata。
    不同存储位置的gas成本不同。storage类型的数据存在链上，类似计算机的硬盘，消耗gas多；
    memory和calldata类型的临时存在内存里，消耗gas少。
    1.storage：合约里的状态变量默认都是storage，存储在链上。
    2. memory：函数里的参数和临时变量一般用memory，存储在内存中，不上链。
    3. calldata：和memory类似，存储在内存中，不上链。与memory的不同点在于calldata变量不能修改（immutable），一般用于函数的参数。
     */

    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        //参数为calldata数组，不能被修改
        // _x[0] = 0 //这样修改会报错
        return(_x);
    }

    /**
    在不同存储类型相互赋值时候，有时会产生独立的副本（修改新变量不会影响原变量），有时会产生引用（修改新变量会影响原变量）。规则如下：
    1.storage（合约的状态变量）赋值给本地storage（函数里的）时候，会创建引用，改变新变量会影响原变量
    2.storage赋值给memory，会创建独立的复本，修改其中一个不会影响另一个；
    3.memory赋值给memory，会创建引用，改变新变量会影响原变量。
    4.其他情况，变量赋值给storage，会创建独立的复本，修改其中一个不会影响另一个。
     */

    uint[] x = [1,2,3]; // 状态变量：数组 x

    function fStorage() public{
        //声明一个storage的变量 xStorage，指向x。修改xStorage也会影响x
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }

    //可以看到x的内容改变了[100,2,3]
    function getX() public view returns(uint256[] memory) {
        return x;
    }

    /**
    变量作用域
    1.状态变量-状态变量是数据存储在链上的变量，所有合约内函数都可以访问 ，gas消耗高。状态变量在合约内、函数外
    2.局部变量-局部变量是仅在函数执行过程中有效的变量，函数退出后，变量无效。局部变量的数据存储在内存里，不上链，gas低。局部变量在函数内声明
    3.全局变量是全局范围工作的变量，都是solidity预留关键字。他们可以在函数内不声明直接使用
    全局变量，更完整的列表 https://learnblockchain.cn/docs/solidity/units-and-global-variables.html#special-variables-and-functions
        blockhash(uint blockNumber): (bytes32)给定区块的哈希值 – 只适用于256最近区块, 不包含当前区块。
        block.coinbase: (address payable) 当前区块矿工的地址
        block.gaslimit: (uint) 当前区块的gaslimit
        block.number: (uint) 当前区块的number
        block.timestamp: (uint) 当前区块的时间戳，为unix纪元以来的秒
        gasleft(): (uint256) 剩余 gas
        msg.data: (bytes calldata) 完整call data
        msg.sender: (address payable) 消息发送者 (当前 caller)
        msg.sig: (bytes4) calldata的前四个字节 (function identifier)
        msg.value: (uint) 当前交易发送的wei值
    */

    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender, blockNum, data);
    }
}   
