// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

// Custom errors are:
//  - gas efficent
//  - can be decraled outside of contracts, in glogal scope
//  - can be defined with parameters, just like events
//  - should be used with `revert`, this might change in future
contract CustomError {
    uint public n;

    error OutofRange(address caller, uint n);

    function setN(uint _n) external {
        if (_n > 1_000_000) {
            revert OutofRange(msg.sender, _n);
        }
        n = _n;
    }
}
