// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {A, B, C} from "../src/Inheritance.sol";

contract InheritanceTest is Test {
    A public a = new A();
    B public b = new B();
    C public c = new C();

    function test_Baz() public {
        assertEq(a.baz(), "A");
    }

    function test_Foo() public {
        assertEq(a.foo(), "A");
        assertEq(b.foo(), "B");
    }

    function test_Bar() public {
        assertEq(a.bar(), "A");
        assertEq(b.bar(), "B");
        assertEq(c.bar(), "C");
    }
}
