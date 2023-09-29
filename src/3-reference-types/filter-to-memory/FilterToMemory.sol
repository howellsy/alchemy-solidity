// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  function filterEven(uint[] calldata numbers) external pure returns (uint[] memory) {
    // find the number of even numbers
    uint numEvenNumbers = 0;
    for (uint i = 0; i < numbers.length; i++) {
      if (numbers[i] % 2 == 0) {
        numEvenNumbers++;
      }
    }

    // fill an array of even numbers in memory
    uint[] memory evenNumbers = new uint[](numEvenNumbers);
    uint index = 0;

    for (uint i = 0; i < numbers.length; i++) {
      if (numbers[i] % 2 == 0) {
        evenNumbers[index] = numbers[i];
        index++;
      }
    }

    return evenNumbers;
  }
}
