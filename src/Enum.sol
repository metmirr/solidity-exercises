// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

// Enums are a data type used to define a set of named constants.
// Variants start from 0, 1 and so on. Default value for an enum is
// the first variant
enum Status {
    None, // 0
    Pending, // 1
    Shipped, // 2
    Completed, // 3
    Rejected, // 4
    Canceled // 5
}

contract Enum {
    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() external view returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status;
    }
}
