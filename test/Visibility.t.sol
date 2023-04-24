//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {VisibilityBase, VisibilityChild} from "../src/Visibility.sol";

contract VisibilityTest is Test {
    VisibilityBase public vb = new VisibilityBase();
    VisibilityChild public vc = new VisibilityChild();

    function test_VisibilityBase() public {
        // vb.x(); // Error: not visible
        // vb.y(); // Error: not visible

        assertEq(vb.z(), 2);
        // assertEq(vb.internalFunc(), 100); // Error: not visible
        assertEq(vc.externalFunc(), 300);
    }

    function test_VisibilityChild() public {
        assertEq(vc.publicFunc(), 200);
        assertEq(vc.externalFunc(), 300);
    }
}
