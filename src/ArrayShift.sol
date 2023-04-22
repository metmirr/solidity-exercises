// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// Copy all elements from right to left starting at the index
// to remove and then popping the last element
contract ArrayShift {
    uint256[] public arr;
    uint256 public arrayLength;

    constructor(uint256[] memory _arr) {
        arr = _arr;
        arrayLength = arr.length;
    }

    function remove(uint256 _index) external {
        require(_index != arr.length);

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
        arrayLength = arr.length;
    }
}
