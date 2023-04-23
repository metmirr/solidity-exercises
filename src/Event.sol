// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// Events allows you to write data on blockchain. This data cannot be retriewed
// by smart contracts. It can be a cheap alternative to storing your data.
// Up to 3 parameters can be indexed.
contract Event {
    event Log(string message, uint256 val);
    event IndexedLog(address indexed sender, uint256 val);

    event Message(address indexed from, address indexed to, string message);

    function emitLog() external {
        emit Log("Hello", 123);
    }

    function emitIndexedLog() external {
        emit IndexedLog(msg.sender, 456);
    }

    function sendMessage(address _to, string calldata _message) external {
        emit Message(msg.sender, _to, _message);
    }
}
