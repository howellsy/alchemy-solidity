// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
  address[] members;
  // @notice This error is thrown when a non-member tries to call a member-only function
  error NotExistingMember();

  constructor() {
    members.push(msg.sender);
  }

  function addMember(address newMemberAddress) external onlyMember {
    members.push(newMemberAddress);
  }

  function isMember(address searchAddress) public view returns (bool foundMember) {
    for (uint i = 0; i < members.length; i++) {
      if (members[i] == searchAddress) {
        foundMember = true;
      }
    }
  }

  function removeLastMember() external onlyMember {
    members.pop();
  }

  modifier onlyMember() {
    if (!isMember(msg.sender)) {
      revert NotExistingMember();
    }
    _;
  }
}
