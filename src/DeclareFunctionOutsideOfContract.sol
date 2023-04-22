// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// It is possible to declare function outside of the contract. This allows you
// to use same function accross contracts.
function isNumberGreeterThenHundred(uint256 _n) pure returns (bool) {
    return _n >= 100;
}

contract DeclareFunctionOutsideOfContract {
    uint256 public n;

    function setN(uint256 _n) external {
        assert(!isNumberGreeterThenHundred(_n));
        n = _n;
    }
}
