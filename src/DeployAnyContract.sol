// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract MyContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not owner");
        owner = _owner;
    }
}

contract MyContract2 {
    address public owner = msg.sender;

    uint256 public value = msg.value;
    uint256 public x;
    uint256 public y;

    constructor(uint256 _x, uint256 _y) payable {
        x = _x;
        y = _y;
    }
}

// Deploy any arbitrary contract
contract Proxy {
    event Deploy(address);

    // When we call another contract it might send some ETH back, so we are defining fallback
    fallback() external payable {}

    receive() external payable {}

    // Takes the contract we want to deploy and its payable so we can send ether
    // when we deploy the contract. Finally, return the deployed contract address.
    function deploy(bytes memory _code) external payable returns (address addr) {
        // We need to use assembly to deploy the contract
        // Inside the assembly we need to call the `create(v, p, n)` function with parameters:
        //  - `v` amount of ETH to send
        //  - `p` pointer in memory to start of code
        //  - `n` size of code
        assembly {
            // inside the assembly msg.value wont' work so we will use callvalue()
            // skip first 32 bytes (32 = 0x20 in hexadecimal) of the code for `p` parameter
            // size of the code is stored in the first 32 bytes of the code = mload(_code)
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        // Make sure there wasn't any error when creating the contract
        // to do so we will check if the `addr` is zero or not
        require(addr != address(0), "Deploy failed");
        emit Deploy(addr);
    }

    // To execute functions on target contract
    function execute(address _target, bytes memory _data) external payable {
        (bool success,) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

// A helper contract to get bytecode of a contract
contract Helper {
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(MyContract1).creationCode;
        return bytecode;
    }

    function getBytecode2(uint256 _x, uint256 _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(MyContract2).creationCode;
        // we need to append our inputs to the bytecode
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    // Here is the function we are gonna be calling to get the data to execute `setOwner(address)`
    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}
