// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {NewImportSyntax} from "../src/NewImportSyntax.sol";

contract NewImportSyntaxTest is Test {
    NewImportSyntax public newImportSyntax;

    function setUp() public {
        newImportSyntax = new NewImportSyntax();
    }

    function testCheckAddress() public view {
        newImportSyntax.checkAddress(address(1));
    }

    function testFailCheckAddress() public view {
        newImportSyntax.checkAddress(address(0));
    }
}
