// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract ArrayType is IArrayType {
    uint256[] array;

    function initArray() public {
        for (uint256 i; i < 200; ++i) {
            array.push(i);
        }
    }
}

contract ArrayTypeOptimized is IArrayType {
    uint256[] array;

    function initArray() public {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 200)
            let dataPtr := add(ptr, 0x20)
            for { let i := 0 } lt(i, 200) { i := add(i, 1) } {
                mstore(add(dataPtr, mul(i, 0x20)), i)
            }
            sstore(array.slot, 200)
            mstore(0x40, add(dataPtr, mul(200, 0x20)))
        }
    }
}
