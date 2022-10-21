// SPDX-License-Identifier: MIT
pragma solidity ^0.6.3;

interface IShop {
    function buy() external;
    function isSold() external view returns (bool);
}

contract Buyer {
    IShop shop;
    
    constructor(address _shop) public {
        shop = IShop(_shop);
    }

    function buy() public {
        shop.buy();
    }

    function price() public view returns (uint) {
        // The first time this function is called it should return 100.
        // Second time it should return something less than 100.
        // We could implement a counter if this function wouldn't be "view" where no state
        // changes are allowed.

        // We can return different values by checking the isSold boolean:
        bool sold = shop.isSold();
        if (!sold) {
            return 100;
        } else {
            return 1;
        }
    }
}

