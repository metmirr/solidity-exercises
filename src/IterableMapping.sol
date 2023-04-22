// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// One way to implement iterable mappings in Solidity is by using an array to store the keys
// in the order they were added to the mapping.
contract IterableMapping {
    mapping(address => uint256) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint256 _val) external {
        balances[_key] = _val;

        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint256) {
        return keys.length;
    }

    function getKeyAtIndex(uint256 _index) external view returns (address) {
        require(_index < keys.length);
        return keys[_index];
    }

    function get(uint256 _index) external view returns (uint256) {
        require(_index < keys.length);
        return balances[keys[_index]];
    }
}
