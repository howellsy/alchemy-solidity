// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  address deployer;

  // @notice Revert if no ether is sent
  error NoDeposit();

    // @notice Revert if not the deployer
  error NotOwner();

  constructor() payable {
    deployer = msg.sender;

    if (!(msg.value >= 1 ether)) {
      revert NoDeposit();
    }
  }

  function withdraw() public {
    if (msg.sender != deployer) {
      revert NotOwner();
    }

    payable(deployer).transfer(address(this).balance);
  }
}
