// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "forge-std/Test.sol";

import {SafeMath} from "../src/SafeMath.sol";

contract SafeMathTest is Test {
    SafeMath public safeMath;

    function setUp() public {
        safeMath = new SafeMath();
    }

    function testFail_Underflow() public view {
        safeMath.underflow();
    }
}
