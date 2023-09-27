// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
  function makeContact(address hero) external {
    bytes memory payload = abi.encodeWithSignature("unknownFunction()");
    (bool success, ) = hero.call(payload);

    require(success);
  }
}
