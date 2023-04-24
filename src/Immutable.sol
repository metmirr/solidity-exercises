//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// Immutable variables can only be initialized when contract is deployed. You
// won't be able to change it later on.
// - they are gas efficient
// - they can be initialized in the constructor or contract level

// Owner is immutable
// Cost of deploying: 33113 gas
contract ImmutableV0 {
    // Cost of calling 182 gas
    address public immutable owner = msg.sender;
}

// Owner is not immutable
// Cost of deploying: 51216 gas
contract ImmutableV1 {
    // Cost of calling 303 gas
    address public owner = msg.sender;
}

// Owner is immutable and set in the constructor
// Cost of deploying: 33113 gas
contract ImmutableV2 {
    // Cost of calling 182 gas
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }
}
