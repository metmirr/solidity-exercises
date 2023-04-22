// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Enum, Status} from "../src/Enum.sol";

contract EnumTest is Test {
    Enum public enm;

    function setUp() public {
        enm = new Enum();
    }

    function testGet() public view {
        Status status = enm.get();
        assert(status == Status.None);
    }

    function testSet() public {
        Status status = Status.Completed;
        enm.set(status);

        assert(enm.get() == status);
    }

    function testShip() public {
        enm.ship();
        assert(enm.get() == Status.Shipped);
    }

    function testReset() external {
        enm.set(Status.Pending);
        assert(enm.get() == Status.Pending);

        enm.reset();
        assert(enm.get() == Status.None);
    }
}
