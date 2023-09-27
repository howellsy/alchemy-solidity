// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Hero.sol";
import "./Fallback.sol";

contract ContractTest is Test {
  Sidekick public sidekick;
  Hero public hero;

  function setUp() public {
    hero = new Hero();
    sidekick = new Sidekick();
  }

  function testMakeContact() public {
    sidekick.makeContact(address(hero));
    assertGt(hero.lastContact(), 0, "it should have set the last contact");
  }
}
