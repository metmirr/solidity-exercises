// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// There are two ways of calling parent functions:
// - direct
// - super
// The difference is when you call directly only that called function will execute
// but with super all parent functions will be executed
contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F, G {
    function foo() public virtual override(F, G) {
        emit Log("H.foo");
        F.foo();
    }

    function bar() public virtual override(F, G) {
        emit Log("H.bar");
        super.bar();
    }
}
