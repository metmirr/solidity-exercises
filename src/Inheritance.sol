// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract A {
    // Can be overriden in child contract
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    // Can be overriden in child contract
    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    // Overriden
    function foo() public pure override returns (string memory) {
        return "B";
    }

    // Can be overriden in child contract
    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }
}
