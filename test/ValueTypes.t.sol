// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {ValueTypes} from "../src/ValueTypes.sol";

contract ValueTypesTest is Test {
    ValueTypes public valueTypes;

    function setUp() public {
        valueTypes = new ValueTypes();
    }

    function testBool() public view {
        assert(!valueTypes.b());
    }

    function testUint() public {
        assertEq(valueTypes.u(), 0);
    }

    function testInt() public {
        assertEq(valueTypes.i(), 0);
    }

    function testAddress() public {
        assertEq(valueTypes.a(), address(0));
    }

    function testBytes32() public {
        assertEq(valueTypes.byt(), bytes32(0));
    }

    function testMaxUint() public {
        assertEq(valueTypes.MAX_UINT(), type(uint).max);
    }

    function testMaxInt() public {
        assertEq(valueTypes.MAX_INT(), type(int).max);
    }
}
