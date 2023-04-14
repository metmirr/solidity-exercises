// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/ArrayShift.sol";

contract ArrayShiftTest is Test {
    ArrayShift public arrayShift;

    function setUp() public {
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arrayShift = new ArrayShift(arr);
    }

    function testRemove() external {
        uint256 lengthBeforeRemove = arrayShift.arrayLength();
        console.log(lengthBeforeRemove);
        arrayShift.remove(2);
        uint256 lengthAfterRemove = arrayShift.arrayLength();

        assert(lengthBeforeRemove != lengthAfterRemove);
    }
}
