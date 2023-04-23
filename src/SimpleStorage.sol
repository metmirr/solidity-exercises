// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

// An simple app that demonstrate storage locations
// This contract:
//  - will store a text
//  - will have a function to set text
//  - will have a function to get text
contract SimpleStorage {
    string public text;

    function set(string calldata _text) external {
        text = _text;
    }

    // when we call this function the `text` will be loaded to memory
    // and then return
    function get() external view returns (string memory) {
        return text;
    }
}
