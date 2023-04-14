// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// Copy all elements from right to left starting at the index
// to remove and then popping the last element
contract ArrayShift {
    uint[] public arr;
    uint public arrayLength;

    constructor(uint[] memory _arr) {
        arr = _arr;
        arrayLength = arr.length;
    }

    function remove(uint _index) external {
        require(_index != arr.length);

        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
        arrayLength = arr.length;
    }
}
