// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Structs} from "../src/Structs.sol";

contract StructsTest is Test {
    Structs public structs;

    function setUp() public {
        structs = new Structs();
    }

    function testCreateCars() public {
        structs.createCars();
    }
}
