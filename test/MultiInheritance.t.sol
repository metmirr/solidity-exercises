//SPDX-License-Identifier: No Lisance
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {X, Y, Z} from "../src/MultiInheritance.sol";

contract MultiInheritance is Test {
    X public x = new X();
    Y public y = new Y();
    Z public z = new Z();

    function test_Foo() public {
        assertEq(x.foo(), "X");
        assertEq(y.foo(), "Y");
        assertEq(z.foo(), "Z");
    }

    function test_Bar() public {
        assertEq(x.bar(), "X");
        assertEq(y.bar(), "Y");
        assertEq(z.bar(), "Z");
    }

    function test_Z() public {
        assertEq(z.x(), "X");
        assertEq(z.y(), "Y");
    }
}
