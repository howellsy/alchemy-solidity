// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  enum Choices {
    Yes,
    No
  }

  struct Vote {
    Choices choice;
    address voter;
  }

  Vote[] public votes;

  function createVote(Choices choice) external {
    Vote memory newVote = Vote(choice, msg.sender);
    votes.push(newVote);
  }

  function findVote(address voter) internal view returns (Vote memory) {
    for (uint i = 0; i < votes.length; i++) {
      if (votes[i].voter == voter) {
        return votes[i];  
      }
    }

    return Vote(Choices.No, address(0));
  }

  function hasVoted(address voter) external view returns (bool) {
    if (findVote(voter).voter == address(0)) {
      return false;
    }

    return true;
  }

  function findChoice(address voter) external view returns (Choices choice) {
    return findVote(voter).choice;
  }
}
