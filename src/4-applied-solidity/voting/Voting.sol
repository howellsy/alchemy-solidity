// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

struct Proposal {
  address target;
  bytes data;
  uint yesCount;
  uint noCount;
  bool accepted;
}

struct Vote {
  bool choice;
  bool hasVoted;
}

contract Voting {
  Proposal[] public proposals;
  address[] public members;

  event ProposalCreated(uint);
  event VoteCast(uint, address);

  mapping(address => mapping(uint => Vote)) public votes;

  // @note This is the minimum number of votes required for a proposal to be accepted
  uint private constant MIN_VOTING_THRESHOLD = 10;

  // @note This error is thrown when a non-member tries to call a member-only function
  error NotMember();

  constructor(address[] memory _members) {
    members = _members;

    // include the contract creator as a member
    members.push(msg.sender);
  }

  function newProposal(address target, bytes memory data) external onlyMember {
    proposals.push(Proposal(target, data, 0, 0, false));

    emit ProposalCreated(proposals.length - 1);
  }

  function isMember(address user) public view returns (bool) {
    for (uint i = 0; i < members.length; i++) {
      if (members[i] == user) {
        return true;
      }
    }

    return false;
  }

  modifier onlyMember() {
    if (!isMember(msg.sender)) {
      revert NotMember();
    }
    _;
  }

  function castVote(uint proposalId, bool isInSupport) external onlyMember {
    Proposal storage proposal = proposals[proposalId];

    if (votes[msg.sender][proposalId].hasVoted) {
      bool previousVote = votes[msg.sender][proposalId].choice;

      // check if the user has changed their vote
      if (previousVote != isInSupport) {
        if (previousVote) {
          proposal.yesCount--;
        } else {
          proposal.noCount--;
        }
      }
    }

    if (isInSupport) {
      proposal.yesCount++;
    } else {
      proposal.noCount++;
    }

    // record the user's vote
    votes[msg.sender][proposalId] = Vote(isInSupport, true);

    emit VoteCast(proposalId, msg.sender);

    if (proposal.yesCount >= MIN_VOTING_THRESHOLD) {
      if (!proposal.accepted) {
        proposal.accepted = true;

        (bool success, ) = proposal.target.call(proposal.data);
        require(success, "Voting: failed to execute proposal");
      }
    }
  }
}
