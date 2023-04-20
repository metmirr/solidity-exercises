// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// A mapping is a type of key-value data structure that is used to store
// and retrieve data efficiently. It is similar to a dictionary or hash map
// in other programming languages.
contract Mapping {
    mapping(address => uint) public balances;

    function getBalance() external view returns (uint) {
        return balances[msg.sender];
    }

    function setBalance(uint _amount) external {
        if (balances[msg.sender] != 0) {
            revert("Already set");
        }
        balances[msg.sender] = _amount;
    }

    function updateBalance(uint _amount) external {
        balances[msg.sender] += _amount;
    }

    function deleteBalance() external {
        delete balances[msg.sender];
    }
}
