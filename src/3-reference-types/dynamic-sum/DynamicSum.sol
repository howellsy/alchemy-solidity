// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  function sum(uint[] memory arrayToSum) external pure returns (uint) {
    uint total = 0;
    uint arrayLength = arrayToSum.length;

    for (uint i = 0; i < arrayLength; i++) {
      total += arrayToSum[i];
    }

    return total;
  }
}
