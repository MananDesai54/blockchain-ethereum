//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

contract A {
    // Call function of other smart contract
    // need interface of B - which is alredy available as B is in same file
    // need address of B
    address addressB;
    
    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }
    function callBar() external view returns(uint) {
        B b = B(addressB);
        uint value = b.bar();
        return value;
    }
    
    // import keyword
    
    
    // contract interface
    
    
    // error propogation
}

contract B {
    function bar() public pure returns(uint) {
        return 10;
    }
}
