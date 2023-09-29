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

  // @notice This error is thrown when a user tries to vote twice
  error AlreadyVoted();

  // @notice This error is thrown when a user tries to change their vote before voting
  error NotYetVoted();

  Vote[] public votes;

  function createVote(Choices choice) external {
    (Vote memory vote, ) = findVote(msg.sender);
    if (vote.voter != address(0)) {
      revert AlreadyVoted();
    }

    Vote memory newVote = Vote(choice, msg.sender);
    votes.push(newVote);
  }

  function findVote(address voter) internal view returns (Vote memory, uint256) {
    for (uint i = 0; i < votes.length; i++) {
      if (votes[i].voter == voter) {
        return (votes[i], i);
      }
    }

    return (Vote(Choices.No, address(0)), 0);
  }

  function hasVoted(address voter) external view returns (bool) {
    (Vote memory vote, ) = findVote(voter);
    if (vote.voter != address(0)) {
      return false;
    }

    return true;
  }

  function changeVote(Choices choice) external {
    (Vote memory vote, uint index) = findVote(msg.sender);

    if (vote.voter == address(0)) {
      revert NotYetVoted();
    }
    votes[index].choice = choice;
  }

  function findChoice(address voter) external view returns (Choices choice) {
    (Vote memory vote, ) = findVote(voter);
    return vote.choice;
  }
}
