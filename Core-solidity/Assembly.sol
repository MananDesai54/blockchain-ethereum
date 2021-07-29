//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

// what is assembly
// Solidity assembly is low level language that allow you to directly manipulate EVM data, It is an escape path to do things that cannot be possible with Solidity. It is more dangerous as we are directly manipulating memory, so use it only if there is no other choice
// Ethereum Virtual Machine (EVM)
// EVM is the machine that runs the SC code, not the same code as we wrote ran by EVM but the code compiles and generate low level byte code instructions(opcodes) that is understood by EVM. By using assembly we directly access the opcodes
contract Assembly {
    // Assembly Syntax
    function foo() external pure {
      uint a;
      uint b;
      uint c;
      c = b+a;
      assembly {
        c := add(a, b)
        let var
        // learn more from docs
      }
    }

    // read and store data
    // in EVM everything is stored in slot of 256 so uint will occupy 1 slot, for more complex types it occupy more than 1 slot, but when we do operation on memory we can work on 1 slot at a time.
    function loadData() external {
      address addr;
      assembly {
        let a := mload(addr)
        mstore(a, 10) // data need to be of size 256, this will store data in temp memory
        sstore(a, 10) // this will store data in storage(permanent) memory
      }
    }

    // ex: detect if address is SC
    function detectAddress() external view returns(bool) {
      uint size;
      address addr;
      assembly {
        size := extcodesize(addr) // returns size of the code at specific ethereum address, every ethereum address has different fields and one of them is code field and if address is not associated with SC then code field will be empty
      }
      if (size > 0) {
        return true;
      }
      return false;
    }

    // ex: cast bytes to bytes32
    function bytesToBytes32() external pure {
      bytes memory data = new bytes(10);
      bytes32 data32;
      assembly {
        data32 := mload(add(data, 32))
      }
    }
}
