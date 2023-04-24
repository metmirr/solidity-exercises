// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {E, F, G, H} from "../src/CallingParentFunctions.sol";

contract CallingParentFunctionsTest is Test {
    event Log(string message);

    E public e = new E();
    F public f = new F();
    G public g = new G();
    H public h = new H();

    function testDirectCall() public {
        // We are going to expect many events from the same function call
        // so we need to repeat expectEvent as much as the expected event from
        // the call. For example our h.foo() will emit 3 events so we need to
        // repeat expectEmit and emit Log 3 times
        // and we are going to check the data only

        vm.expectEmit(false, false, false, true);
        emit Log("H.foo");

        vm.expectEmit(false, false, false, true);
        emit Log("F.foo");

        vm.expectEmit(false, false, false, true);
        emit Log("E.foo");

        h.foo();
    }

    function test_SuperCall() public {
        vm.expectEmit(false, false, false, true);
        emit Log("H.bar");

        vm.expectEmit(false, false, false, true);
        emit Log("G.bar");

        vm.expectEmit(false, false, false, true);
        emit Log("F.bar");

        vm.expectEmit(false, false, false, true);
        emit Log("E.bar");

        h.bar();
    }
}
