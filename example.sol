// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

contract Example {
  address public owner;
  constructor() public {
    owner = msg.sender;
  }
  function isOwner() public view returns (bool) {
    return(msg.sender == owner);
  }
}