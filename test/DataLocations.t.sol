// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DataLocations} from "../src/DataLocations.sol";

contract DataLocationsTest is Test {
    DataLocations public dataLocations;

    function setUp() public {
        dataLocations = new DataLocations();
    }

    function testCreateMyStructMemory() public {
        dataLocations.createMyStructMemory(1, "foo");
    }

    function testCreateMyStructCalldata() public {
        dataLocations.createMyStructCalldata(1, "bar");
    }

    function testReadMyStructMemory() public {
        dataLocations.readMyStructMemory();
    }

    function testReadMyStructStorage() public {
        dataLocations.readMyStructStorage();
    }

    function testSetArrayMemory() public {
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        dataLocations.setArrayMemory(arr);
    }

    function testSetArrayCalldata() public {
        uint[] memory arr = new uint[](3);
        arr[0] = 1;
        dataLocations.setArrayCalldata(arr);
    }
}
