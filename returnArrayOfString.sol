// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma abicoder v2;

contract Lottery {
    address public manager;
    string[] public array;
    constructor() {
        manager = msg.sender;
        array.push("gg");
    }
    function getArray() public view returns (string[] memory) {
        return array;
    }
}