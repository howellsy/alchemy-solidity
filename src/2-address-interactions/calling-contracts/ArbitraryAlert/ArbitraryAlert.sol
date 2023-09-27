// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
  function relay(address hero, bytes memory data) external {
    // send all of the data as calldata to the hero
    (bool success, ) = hero.call(data);

    require(success);
  }
}
