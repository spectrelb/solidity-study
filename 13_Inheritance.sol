//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

/**
    规则:
    virtual: 父合约中的函数，如果希望子合约重写，需要加上virtual关键字。
    override：子合约重写了父合约中的函数，需要加上override关键字。
*/
contract Yeye {
    event Log(string msg);

    function hip() public virtual {
        emit Log("yeye");
    }

    function pop() public virtual {
        emit Log("yeye");
    }

    function yeye() public virtual {
        emit Log("yeye");
    }
}

contract Baba is Yeye {
    function hip() public virtual override {
        emit Log("baba");
    }

    function pop() public virtual override{
        emit Log("baba");
    }

   function baba() public virtual {
        emit Log("baba");
    }
}


contract Erzi is Yeye, Baba {
    // 继承两个function: hip()和pop()，输出值为Erzi。
    function hip() public virtual override(Yeye, Baba){
        emit Log("Erzi");
    }

    function pop() public virtual override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function callParent() public{
        Yeye.pop();
    }

    function callParentSuper() public{
        // 将调用最近的父合约函数，Baba.pop()
        super.pop();
    }
}