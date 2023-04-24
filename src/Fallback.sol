//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// Fallback function is executed when
//  - called function does not exists
//  - directly sending ether
//
// Receive function is executed when msg.data is empty, if receive is dont
// defined and msg.data is empty then `fallback` will be executed.
contract Fallback {
    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
