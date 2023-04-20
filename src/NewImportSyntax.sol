// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

import {isZeroAddress, ZeroAddress} from "./Helper.sol";

contract NewImportSyntax {
    function checkAddress(address _addr) public pure {
        if (isZeroAddress(_addr)) {
            revert ZeroAddress();
        }
    }
}
