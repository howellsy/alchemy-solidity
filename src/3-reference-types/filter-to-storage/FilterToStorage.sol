// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  uint[] public evenNumbers;

  function filterEven(uint[] calldata arrayToFilter) external {
    for (uint i = 0; i < arrayToFilter.length; i++) {
      if (arrayToFilter[i] % 2 == 0) {
        evenNumbers.push(arrayToFilter[i]);
      }
    }
  }
}
