// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

error ZeroAddress();

function isZeroAddress(address _addr) pure returns (bool) {
    return _addr == address(0);
}
