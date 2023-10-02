// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Ownable {
  address public owner;
  error Unauthorised();

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if (msg.sender != owner) {
      revert Unauthorised();
    }
    _;
  }
}

contract Transferable is Ownable {
  function transfer(address newOwner) external onlyOwner {
    owner = newOwner;
  }
}
