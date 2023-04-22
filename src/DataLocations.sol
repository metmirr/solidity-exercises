// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// Data Locations - storage, memory, calldata
//  - `storage` means a variable is state variable
//  - `memory` means data is loaded onto memory
//  - `calldata` is like memory except it can only be used with function inputs
//
// * prefer `calldata` over `memory` to save gas: `memory` require to copy data when
//  calling another function.
// * `calldata` is immutable
contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // gas 45419
    function createMyStructMemory(uint _foo, string memory _text) external {
        myStructs[msg.sender] = MyStruct(_foo, _text);
    }

    // gas 45338
    function createMyStructCalldata(uint _foo, string calldata _text) external {
        myStructs[msg.sender] = MyStruct(_foo, _text);
    }

    // gas 25749
    // Read storage location and load to memory. Then update and then update mapping
    // with this updated instance of the struct
    function readMyStructMemory() external {
        // any operation on this variable will be lost at the end of function execution
        MyStruct memory mystructReadonly = myStructs[msg.sender];
        mystructReadonly.foo = 123;

        myStructs[msg.sender] = mystructReadonly;
    }

    // gas 22823
    // Read storage location and update it.
    function readMyStructStorage() external {
        // any operation on this variable will stay in the state
        MyStruct storage mystruct = myStructs[msg.sender];
        mystruct.text = "bar";
    }

    // 800
    function setArrayMemory(uint[] memory _arr) external {
        // This function call will copy all the items from `_arr`
        _internalMemory(_arr);
    }

    // gas 463
    function setArrayCalldata(uint[] calldata _arr) external {
        // No copy - cheaper
        _internalCalldata(_arr);
    }

    function _internalMemory(uint[] memory arr) private {}

    function _internalCalldata(uint[] calldata arr) private {}
}
