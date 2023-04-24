// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {ImmutableV0, ImmutableV1, ImmutableV2} from "../src/Immutable.sol";

contract ImmutableTest is Test {
    function test_OwnerV0() public {
        ImmutableV0 im = new ImmutableV0();
        assertEq(im.owner(), address(this));
    }

    function test_OwnerV1() public {
        ImmutableV1 im = new ImmutableV1();
        assertEq(im.owner(), address(this));
    }

    function test_OwnerV2() public {
        ImmutableV2 im = new ImmutableV2();
        assertEq(im.owner(), address(this));
    }
}
