// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";

import {ArrayReplaceLast} from "../src/ArrayReplaceLast.sol";

contract ArrayReplaceLastTest is Test {
    ArrayReplaceLast public arrayReplaceLast;

    function setUp() public {
        uint256[] memory arr = new uint256[](3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arrayReplaceLast = new ArrayReplaceLast(arr);
    }

    function testRemove() public {
        uint beforeRemove = arrayReplaceLast.arrayLenght();
        arrayReplaceLast.remove(1);
        uint afterRemove = arrayReplaceLast.arrayLenght();

        assert(beforeRemove != afterRemove);
    }
}
