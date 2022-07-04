//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract IfElseAndInsertSort {
    function ifElseTest(uint _num) public pure returns(bool) {
        if (_num > 0) {
            return true;
        } else {
            return false;
        }
    }

    function forLoopTest() public pure returns(uint256) {
        uint256 sum = 0;
        for (uint256 index = 0; index < 100; index++) {
            sum += index;
        }

        return sum;
    }

    function whileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        while(i < 10){
            sum += i;
            i++;
        }
        return(sum);
    }

    function doWhileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        do{
            sum += i;
            i++;
        } while(i < 10);
        return(sum);
    }

    // 三元运算符
    function ternaryTest(uint256 x, uint256 y) public pure returns(uint256){
        return x >= y ? x: y; 
    }

       // 插入排序 正确版
    function insertionSort(uint[] memory a) public pure returns(uint[] memory) {
        // note that uint can not take negative value
        for (uint i = 1;i < a.length;i++){
            uint temp = a[i];
            uint j=i;
            while( (j >= 1) && (temp < a[j-1])){
                a[j] = a[j-1];
                j--;
            }
            a[j] = temp;
        }
        return(a);
    }
}