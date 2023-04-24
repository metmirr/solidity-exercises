//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Fallback} from "../src/Fallback.sol";

contract FallbackTest is Test {
    Fallback public fb;

    event Log(string func, address sender, uint value, bytes data);

    function setUp() public {
        fb = new Fallback();
    }

    function test_Fallback() public {
        uint256 val = 1 ether;

        vm.expectEmit(false, false, false, true);
        emit Log("fallback", address(this), val, "0xabc");

        (bool success, ) = address(fb).call{value: val}("0xabc");
        assert(success);

        uint256 balance = fb.getBalance();

        assertEq(val, balance);
    }

    function test_Receive() public {
        uint256 val = 1 ether;

        vm.expectEmit(false, false, false, true);
        emit Log("receive", address(this), val, "");

        (bool success, ) = address(fb).call{value: val}("");
        assert(success);

        uint256 balance = fb.getBalance();

        assertEq(val, balance);
    }
}
