// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// Value types stores values.
//
// Value types are:
//  - `bool`
//  - `uint` -> alias for `uint256`
//  - `int` -> alias for `int256`
//  - `address`
//  - `bytes32`

contract ValueTypes {
    bool public b;
    uint public u;
    int public i;
    address public a;
    bytes32 public byt;

    uint public constant MAX_UINT = type(uint).max;
    int public constant MAX_INT = type(int).max;
}
