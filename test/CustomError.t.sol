// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {CustomError} from "../src/CustomError.sol";

contract CustomErrorTest is Test {
    CustomError public customError;

    function setUp() public {
        customError = new CustomError();
    }

    function testSetN() public {
        customError.setN(100_000);
    }

    function testFailSetN() public {
        customError.setN(2_000_000);
    }
}
