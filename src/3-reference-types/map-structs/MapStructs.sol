// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  struct User {
    uint balance;
    bool isActive;
  }

  mapping(address => User) public users;

  error InsufficientBalance();
  error NoActiveUserFound();
  error UserAlreadyExists();

  function createUser() external {
    if (users[msg.sender].isActive) {
      revert UserAlreadyExists();
    }

    User memory newUser = User(100, true);
    users[msg.sender] = newUser;
  }

  function transfer(address recipient, uint amount) external {
    if (users[msg.sender].balance < amount) {
      revert InsufficientBalance();
    }

    if (!users[recipient].isActive || !users[msg.sender].isActive) {
      revert NoActiveUserFound();
    }

    users[msg.sender].balance -= amount;
    users[recipient].balance += amount;
  }
}
