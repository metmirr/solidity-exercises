// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// An efficient algorithm to remove an element from an array:
// It override element at the index with the last element in the array
// then pop the last element from the array.
//
// Think of swapping elements then popping the last element from the array
contract ArrayReplaceLast {
    uint256[] public arr;

    constructor(uint256[] memory _arr) {
        arr = _arr;
    }

    function arrayLenght() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 _index) external {
        require(_index != arrayLenght());

        arr[_index] = arr[arrayLenght() - 1];
        arr.pop();
    }
}
