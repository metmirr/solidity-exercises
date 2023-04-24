//SPDX-License-Identifier: No Lisance
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {S, T, V0, V1, V2, V3} from "../src/CallingParentConstructor.sol";

contract CallingParentConstructor is Test {
    function test_V0() public {
        V0 v0 = new V0();

        assertEq(v0.name(), "s");
        assertEq(v0.text(), "t");
    }

    function test_V1() public {
        string memory name = "foo";
        string memory text = "hello";

        V1 v1 = new V1(name, text);

        assertEq(v1.name(), name);
        assertEq(v1.text(), text);
    }

    function test_V2() public {
        string memory name = "foo";
        string memory text = "hello";

        V2 v2 = new V2(name, text);

        assertEq(v2.name(), name);
        assertEq(v2.text(), text);
    }

    function test_V3() public {
        string memory name = "foo";

        V3 v2 = new V3(name);

        assertEq(v2.name(), name);
        assertEq(v2.text(), "t");
    }
}
