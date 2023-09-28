// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
  address public arbiter;
  address public beneficiary;
  address public depositor;

  event Approved(uint256);

  // @notice Revert if not called by arbiter
  error OnlyArbiter();

  constructor(address _arbiter, address _beneficiary) payable {
    arbiter = _arbiter;
    beneficiary = _beneficiary;
    depositor = msg.sender;
  }

  function approve() external {
    if (msg.sender != arbiter) {
      revert OnlyArbiter();
    }

    uint contractBalance = address(this).balance;
    payable(beneficiary).transfer(contractBalance);
    emit Approved(contractBalance);
  }
}
