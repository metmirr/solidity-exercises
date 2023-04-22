// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// Before v0.8: If a number goes below to minimum number it underflows to maximum
// number, and when it goes above maximum then it overflow to minimum.
contract SafeMath {
    function underflow() public pure returns (uint256) {
        uint256 x = 0;
        x--; // VM error: revert
        return x;
    }

    function uncheckedUnderflow() public pure returns (uint256) {
        uint256 x = 0;
        unchecked {
            x--; // ok
        }
        return x;
    }
}
