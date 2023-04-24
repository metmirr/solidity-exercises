// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// when you do multiple inheretance the order should be most base like to derived
contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure virtual returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }

    function y() public pure virtual returns (string memory) {
        return "Y";
    }
}

// If we change the order to `Z is Y, X` it won't compile
// The order in `override(X, Y)` doesn't matter
contract Z is X, Y {
    function foo() public pure virtual override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure virtual override(Y, X) returns (string memory) {
        return "Z";
    }
}
