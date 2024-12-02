// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract PackVariables is IPackVariables {
    uint8 one;
    uint256 two;
    bytes18 three;
    uint8[30] four;
    bytes14 five;
    uint8 six;

    function setValues(uint8 _one, uint256 _two, bytes18 _three, uint8[30] calldata _four, bytes14 _five, uint8 _six)
        public
    {
        one = _one;
        two = _two;
        three = _three;
        four = _four;
        five = _five;
        six = _six;
    }
}

contract PackVariablesOptimized is IPackVariables {
    struct PackedData {
        uint8 one;
        uint8 six;
        bytes14 five;
        bytes18 three;
        uint256 two;
        uint8[30] four;
    }

    PackedData private data;

    function setValues(uint8 _one, uint256 _two, bytes18 _three, uint8[30] calldata _four, bytes14 _five, uint8 _six)
        public
    {
        data.one = _one;
        data.six = _six;
        data.five = _five;
        data.three = _three;
        data.two = _two;
        data.four = _four;
    }
}
