// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  address public owner;
  uint public balance;

  constructor() {
    owner = msg.sender;
  }

  receive() external payable {
    balance += msg.value;
  }

  function tip() external payable {
    payable(owner).transfer(msg.value);    
  }
}
