//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

// When error occur in SC the code below it will not execute and if is there any state change before error then those need to be reverted so we still need to pay gas for error in txn for the state that changed before error!
// Only called from functions
contract Error {
    // throw => deprecated don't use
    // revert => to throw error
    function revertErr() external pure {
        revert("Reason for revert");
    }

    // require => Conditional throw error with custom message
    function requireErr() external pure {
        require(10 != 100, "message");
    }

    // assert => takes only condition as input
    function assertErr() external pure {
        require(10 != 100);
    }

    // for require we check things that can go wrong while execution(error that happen normally) like value of a greater then 10
    // for assert we provide the error that can never happen like address can never be 0x0

    // error in other contract
}
