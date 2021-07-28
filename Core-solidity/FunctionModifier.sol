//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

contract FunctionModifier {
    // syntax
    // allows to to run some code before running function
    address admin;

    constructor() public {
        admin = msg.sender;
    }

    modifier someModifier(address addr, uint256 a) {
        require(msg.sender == addr, "Error");
        _;
    }
    modifier someModifier2(address addr, uint256 a) {
        require(msg.sender == addr, "Error");
        _;
    }
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not an admin");
        _;
    }

    function foo(uint256 a)
        external
        someModifier(msg.sender, a)
        someModifier2(msg.sender, a)
    {
        //...
    }

    // passing args
    // chaining modifiers
    // access control
}
