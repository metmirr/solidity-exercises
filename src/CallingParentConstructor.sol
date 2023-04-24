// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// The order of calling parent contructors is determined by the order of
// inheritance.
// There are two ways of calling parent contructors:
//  - Call directly from contract defination (in this case you know what params to pass)
//  - Call from child constructor(usually when params are dynamic you will use)
contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Order of constructor execution:
// 1. S
// 2. T
// 3. V0
contract V0 is S("s"), T("t") {}

// The order of constructor will be `S`, `T`. Even if we call `T`'s constructor first in the
// contract defination it won't matter the calling order will be `S` first then `T`
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {}
}

// Order of constructor execution:
// 1. T
// 2. S
// 3. V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}

// Order of constructor execution:
// 1. S
// 2. T
// 3. V3
contract V3 is S, T("t") {
    constructor(string memory _name) S(_name) {}
}
