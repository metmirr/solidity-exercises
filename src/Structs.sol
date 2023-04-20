// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

// A struct is a custom-defined data structure that groups together one or more related
// variables of different types into a single unit. You can think of a struct as a
// template for creating new types of variables that have a specific set of properties.
contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    // A single car
    Car public car;
    // A Car array
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function createCars() external {
        // Cars in memory will go away when the function is done
        Car memory toyota = Car("toyota", 2020, msg.sender);
        Car memory lambo = Car({
            model: "lamborghini",
            owner: msg.sender,
            year: 2023
        });
        // uninitialized Car - all fields are set to their default value
        Car memory tesla;
        // tesla.model - is empty string
        // tesla.year - is 0
        // tesla.address - is address(0)
        // lets set this values
        tesla.model = "Tesla";
        tesla.year = 2023;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        // Equals to defining in `memory`
        cars.push(Car("Ferrari", 1990, msg.sender));

        // To update a car from cars array we need to use `storage` location
        Car storage _car = cars[0];
        _car.year = 2015;
        delete _car.owner; // Set owner to address(0)

        // Set all the field to default value for the car at index 1
        delete cars[1];
    }
}
