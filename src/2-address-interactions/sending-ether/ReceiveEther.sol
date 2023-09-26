// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  address private owner;
  uint public balance;

  constructor() {
    owner = msg.sender;
  }

  receive() external payable {
    balance += msg.value;
  }
}
