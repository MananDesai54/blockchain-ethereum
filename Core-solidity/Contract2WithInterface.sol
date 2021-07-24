//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

// interface doesn't allow to inherit from other interface so InterfaceB2 is created as abstract contract
interface InterfaceB {
    function bar() external pure returns (uint256);
}

// Here We can inherit from other contracts
abstract contract InterfaceB2 {
    function foo() external pure virtual returns (uint256);
}

contract B {
    function bar() external pure returns (uint256) {
        return 10;
    }

    function foo() external pure returns (uint256) {
        return 10;
    }
}
