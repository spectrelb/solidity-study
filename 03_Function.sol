//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract Function {
    /**
    function (<parameter types>) {internal|external} [pure|view|payable] [returns (<return types>)]
    1.function：声明函数时的固定用法，想写函数，就要以function关键字开头。
    2.(<parameter types>)：圆括号里写函数的参数，也就是要输入到函数的变量类型和名字。
    3.{internal|external|public|private}：函数可见性说明符，一共4种。没标明函数类型的，默认internal。
        public: 内部外部均可见。(也可用于修饰状态变量，public变量会自动生成 getter函数，用于查询数值).
        private: 只能从本合约内部访问，继承的合约也不能用（也可用于修饰状态变量）。
        external: 只能从合约外部访问（但是可以用this.f()来调用，f是函数名）
        internal: 只能从合约内部访问，继承的合约可以用（也可用于修饰状态变量）。
    4.[pure|view|payable]：决定函数权限/功能的关键字。payable（可支付的）很好理解，带着它的函数，运行的时候可以给合约转入ETH。
    5.[returns ()]：函数返回的变量类型和名称。
    */

    /**
    到底什么是Pure和View？
        solidity加入这两个关键字，是因为gas fee。
        合约的状态变量存储在链上，gas fee很贵，如果不改写链上变量，就不用付gas。
        调用pure跟view的函数是不需要付gas的。
    1.pure关键字的函数，不能读取也不能写入存储在链上的状态变量
    2.view关键字的函数，能读取但不能写入状态变量
    3.不写pure也不写view，函数既可以读取也可以写入状态变量。
    */
    
    uint256 public number = 5;
    
    // 如果add()包含了pure关键字，例如 function add() pure external，就会报错。因为pure是不能读取合约里的状态变量的，也不能改写
    // 如果add()包含了view关键字，例如 function add() view external，就会报错。因为view是不能改写合约里的状态变量的
    function add() external {
        number += 1;
    }

    // pure
    function addPure(uint256 _number) external pure returns(uint256){
        return _number + 1;
    }

    // view能读取，但不能够改写状态变量
    function addView() external view returns(uint256){
        return number+1;
    }

    // internal: 内部
    function minus() internal {
        number += 1;
    }

    // 合约内的函数可以调用内部函数
    function minusCall() external {
        minus();
    }

    // payable: 能给合约支付eth的函数
    function minusPayable() external payable returns(uint256) {
         minus();
         return address(this).balance;
    }
}