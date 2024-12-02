// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import "src/04. Loops.sol";

// forge test --match-contract Loops
// forge test --match-contract Loops --gas-report
contract LoopsTest is Test {
    Loops loops;

    function setUp() public {
        loops = new Loops();
    }

    function test_for() public view {
        loops.loopFor();
    }

    function test_while() public view {
        loops.loopWhile();
    }

    function test_doWhile() public view {
        loops.loopDoWhile();
    }
}

contract LoopsOptimizedTest is Test {
    LoopsOptimized loopsOpt;

    function setUp() public {
        loopsOpt = new LoopsOptimized();
    }

    function test_forOptimized() public view {
        loopsOpt.loopFor();
    }

    function test_whileOptimized() public view {
        loopsOpt.loopWhile();
    }

    function test_doWhileOptimized() public view {
        loopsOpt.loopDoWhile();
    }
}
