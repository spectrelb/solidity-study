//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

contract OtherContract {
    uint256 private _x = 0;

    event Log(uint amount, uint gas);
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setX(uint256 x) external payable {
        _x = x;
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns(uint x) {
        x = _x;
    }
}

contract CallContract {
    function callSetX(address _addr, uint256 x) external {
        OtherContract(_addr).setX(x);
    }

    function callGetX(OtherContract _addr) external view returns(uint) {
        return _addr.getX();
    }

    function setXTransferETH(address otherContract, uint256 x) payable external{
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}