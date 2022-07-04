//SPDX-License-Identifier: UNLICENSED
pragma solidity  ^0.8.0;

abstract contract Base {
    string public name = "Base";

    function getAlias() public pure virtual returns (string memory);
}

contract BaseImpl is Base {
     function getAlias() public pure override returns (string memory) {
        return "BaseImpl";
     }
}

interface IBase {
    function getFirstName() external pure returns (string memory);
    function getLastName() external pure returns (string memory);
}

contract IBaseImpl is IBase {
    function getFirstName() external pure override returns (string memory)   {
         return "liu";
    }

    function getLastName() external pure override returns (string memory){
        return "bo";
    }
}