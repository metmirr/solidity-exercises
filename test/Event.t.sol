// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Log(string message, uint256 val);
    event IndexedLog(address indexed sender, uint256 val);

    event Message(address indexed from, address indexed to, string message);

    function setUp() public {
        e = new Event();
    }

    function test_LogEvent() public {
        vm.expectEmit(false, false, false, false);
        emit Log("Hello", 123);
        e.emitLog();
    }

    function test_IndexedLogEvent() public {
        vm.expectEmit(true, false, false, false);
        emit IndexedLog(address(this), 456);
        e.emitIndexedLog();
    }

    function test_SendMessage() public {
        vm.expectEmit(true, true, false, false);
        emit Message(address(this), address(1), "Hello");
        e.sendMessage(address(1), "Hello");
    }
}
