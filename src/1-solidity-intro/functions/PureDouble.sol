// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
  function double(uint x) external pure returns (uint result) {
    result = x * 2;
  }
}
