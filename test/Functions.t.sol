// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Functions} from "../src/Functions.sol";

contract FunctionsTest is Test {
    Functions public f;

    function setUp() public {
        f = new Functions();
    }

    function testAll() public {
        f.callExternalFunction();
        f.callPublicFunction();
        f.externalFunction();
        f.publicFunction();
        f.pureFunction();
        f.viewFunction();
        assertEq(f.viewFunction(), 1);
    }
}
