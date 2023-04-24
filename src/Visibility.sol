//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// visibility:
// - `private` only inside the contract
// - `internal` only inside the contract and child contracts
// - `public` inside and outside contract
// - `external` only from outside contract
contract VisibilityBase {
    uint256 private x = 0;
    uint256 internal y = 1;
    uint256 public z = 2;

    function privateFunc() private pure returns (uint256) {
        return 0;
    }

    function internalFunc() internal pure returns (uint256) {
        return 100;
    }

    function publicFunc() public pure returns (uint256) {
        return 200;
    }

    function externalFunc() external pure returns (uint256) {
        return 300;
    }

    function testVisibility() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
        // externalFunc(); // Error: not accessable
    }
}

contract VisibilityChild is VisibilityBase {
    function testChildVisibility() external view {
        // x; // Error: not accessable
        y + z;
        // privateFunc(); // Error: not visible
        internalFunc();
        publicFunc();
        // externalFunc(); // Error not visible
    }
}
