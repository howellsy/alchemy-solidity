// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  // @notice Revert if no ether is sent
  error NoDeposit();

  constructor() payable {
    if (!(msg.value >= 1 ether)) {
      revert NoDeposit();
    }
  }
}
