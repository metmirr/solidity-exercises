//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// `payable` keyword add functionality to receive and send Ether
contract Payable {
    // We can declare addresses as payable
    address payable public owner;

    function deposit() external payable {}

    function nonPayableDeposit() external {}

    // Get ETH balance of the contract
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
