//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;
import "./Contract2WithInterface.sol";
import "./Contract2.sol";

contract A {
    // Call function of other smart contract
    // need interface of B - which is already available as B is in same file
    // need address of B
    address addressB;
    address addressC;

    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }

    function setAddressC(address _addressC) external {
        addressC = _addressC;
    }

    function callBar() external view returns (uint256) {
        InterfaceB b = InterfaceB(addressB);
        uint256 value = b.bar();

        InterfaceB2 b2 = InterfaceB2(addressB);
        uint256 value2 = b2.foo();

        B b3 = B(addressB);
        uint256 val0 = b3.bar() + b3.foo();

        C c = C(addressC);
        uint256 val = c.bar();

        return value + value2 + val + val0;
    }

    // import keyword

    // contract interface

    // error propagation
    // If we have error in imported or other smart contract and we are using them in current smart contract then if error occur then that error will be propagated to current smart contract and txn or query will fail
}
