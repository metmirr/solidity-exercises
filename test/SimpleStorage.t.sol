// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public ss;

    function setUp() public {
        ss = new SimpleStorage();
    }

    function testSet() public {
        string memory text = "Hello";
        ss.set(text);
        assertEq(ss.get(), text);
    }

    function testGet() public {
        assertEq(ss.get(), "");
    }
}
