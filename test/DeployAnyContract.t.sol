// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Helper, Proxy, MyContract1, MyContract2} from "../src/DeployAnyContract.sol";

contract DeployAnyContractTest is Test {
    Helper public helper;
    Proxy public proxy;

    function setUp() public {
        helper = new Helper();
        proxy = new Proxy();
    }

    function testDeployMyContract1() public {
        bytes memory bytecode = helper.getBytecode1();
        address mycontract1Address = proxy.deploy(bytecode);
        MyContract1 mycontract1 = MyContract1(mycontract1Address);

        assertEq(address(proxy), mycontract1.owner());
    }

    function testSetOwner() public {
        bytes memory bytecode = helper.getBytecode1();
        bytes memory data = helper.getCalldata(address(1));

        address mycontract1Address = proxy.deploy(bytecode);
        MyContract1 mycontract1 = MyContract1(mycontract1Address);
        proxy.execute(mycontract1Address, data);

        assertEq(mycontract1.owner(), address(1));
    }

    function testDeployMyContract2() public {
        (uint256 x, uint256 y) = (1, 2);
        uint256 val = 123 ether;
        bytes memory bytecode = helper.getBytecode2(x, y);
        address mycontract2Address = proxy.deploy{value: val}(bytecode);

        MyContract2 mycontract2 = MyContract2(mycontract2Address);

        assertEq(mycontract2.x(), x);
        assertEq(mycontract2.y(), y);
        assertEq(mycontract2.value(), val);
    }
}
