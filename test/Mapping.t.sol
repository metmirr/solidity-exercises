// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {Mapping} from "../src/Mapping.sol";

contract MappingTest is Test {
    Mapping public m;

    function setUp() public {
        m = new Mapping();
    }

    function testGetBalance() public {
        assertEq(m.getBalance(), 0);
    }

    function testSetBalance() public {
        uint256 amount = 123;
        m.setBalance(amount);
        uint256 currentBalance = m.getBalance();

        assertEq(amount, currentBalance);
    }

    function testFail_setBalance() public {
        m.setBalance(1);
        m.setBalance(2);
    }

    function testUpdateBalance() public {
        uint256 balanceBeforeUpdate = m.getBalance();
        m.updateBalance(456);
        uint256 balanceAfterUpdate = m.getBalance();

        assert(balanceAfterUpdate != balanceBeforeUpdate);
    }

    function testDeleteBalance() public {
        m.setBalance(123);
        uint256 balance = m.getBalance();

        m.deleteBalance();
        uint256 newBalance = m.getBalance();

        assert(balance != newBalance);
    }
}
