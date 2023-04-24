// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Payable} from "../src/Payable.sol";

contract PayableTest is Test {
    Payable public p;

    function setUp() public {
        p = new Payable();
    }

    function test_Deposit() public {
        uint256 balanceBeforeDeposit = p.getBalance();
        uint256 val = 1 ether;

        p.deposit{value: val}();

        uint256 balanceAfterDeposit = p.getBalance();

        assertEq(balanceBeforeDeposit + val, balanceAfterDeposit);
    }
}
