// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// Functions
//  - `public` functions can be called internally or via messages
//  - `private` functions are only visible for the contract they are defined in not in the derived
//     contracts
//  - `external` functions can be called from other contracts and via transactions. An external
//     function `f` cannot be called internally(i.e `f()` does not work, but `this.f()` works)
//  - `pure` functions are readonly
//  - `view` functions don't modify the state but read from the state
//  - `view` and `pure` can be use with `public` and `external`
//
contract Functions {
    function privateFunction() private {
        // code...
    }

    function publicFunction() public {
        // code...
    }

    function externalFunction() external {
        // code...
    }

    function pureFunction() external pure returns (bool) {
        // We are not reading state or modifying
        return true;
    }

    function viewFunction() public view returns (uint256) {
        // we are reading state
        return block.number;
    }

    function callPublicFunction() public {
        publicFunction(); // no need to call on `this`
    }

    function callExternalFunction() public {
        this.externalFunction(); // need to call on `this`
    }
}
