// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  address private charityAddress;
  address public owner;
  uint public balance;

  constructor(address _charityAddress) {
    charityAddress = _charityAddress;
    owner = msg.sender;
  }

  receive() external payable {
    balance += msg.value;
  }

  function tip() external payable {
    payable(owner).transfer(msg.value);
  }

  function donate() external payable {
    payable(charityAddress).transfer(balance);
  }
}
