// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
  function alert() external;
}

contract Sidekick {
  function sendAlert(address hero) external {
    // Use the IHero interface and the hero address passed into sendAlert to call alert on the hero contract
    IHero(hero).alert();
  }
}
