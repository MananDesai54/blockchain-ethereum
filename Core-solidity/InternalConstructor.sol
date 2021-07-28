//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

abstract contract Parent {
    constructor(uint256 a) internal {}
}

contract Child is Parent {
    constructor(uint256 a) public Parent(a) {
        //it can be empty
    }
}
