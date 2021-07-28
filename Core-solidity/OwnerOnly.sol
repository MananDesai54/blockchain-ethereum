//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

contract OwnerOnly {
    address admin;

    constructor() public {
        admin = msg.sender;
    }

    function restricted() external {
        if (msg.sender == admin) {} else {
            revert();
        }
    }
}
