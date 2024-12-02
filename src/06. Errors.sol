// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Errors is IErrors {
    address owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: You are not a owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}

contract ErrorsOptimized is IErrors {
    error Unauthorized();

    constructor() {
        assembly {
            sstore(0, caller())
        }
    }

    function call() public view {
        assembly {
            if iszero(eq(caller(), sload(0))) {
                mstore(0x00, 0x82b42900)
                revert(0x1c, 0x04)
            }
        }
    }
}
