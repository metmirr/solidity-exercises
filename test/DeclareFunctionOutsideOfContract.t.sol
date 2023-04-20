// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeclareFunctionOutsideOfContract} from "../src/DeclareFunctionOutsideOfContract.sol";

contract DeclareFunctionOutsideOfContractTest is Test {
    DeclareFunctionOutsideOfContract public c;

    function setUp() public {
        c = new DeclareFunctionOutsideOfContract();
    }

    function testSetN() public {
        c.setN(99);
    }

    function testFailSetN() public {
        c.setN(101);
    }
}
