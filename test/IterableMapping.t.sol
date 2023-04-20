// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {IterableMapping} from "../src/IterableMapping.sol";

contract IterableMappingTest is Test {
    IterableMapping public iterableMapping;

    function setUp() public {
        iterableMapping = new IterableMapping();
    }

    function testSet() public {
        iterableMapping.set(address(1), 99);
    }

    function testGetSize() public {
        iterableMapping.set(address(1), 99);

        assertEq(iterableMapping.getSize(), 1);
    }

    function testGetKeyAtIndex() public {
        iterableMapping.set(address(1), 99);
        assertEq(iterableMapping.getKeyAtIndex(0), address(1));
    }

    function testFail_GetKeyAtIndex() public view {
        iterableMapping.getKeyAtIndex(0);
    }

    function testGet() public {
        iterableMapping.set(address(1), 99);
        assertEq(iterableMapping.get(0), 99);
    }
}
