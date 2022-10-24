//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC20/IERC20.sol";

// We create two tokens and mint 100 to ourselves and 100 to the dex instance
// so that the reserve ratios stay the same (100 and 100) when swapping.

contract FakeToken1 is ERC20 {
    
    constructor(address _dexTwo, uint initialSupply) public ERC20("FKTOKEN1", "FKT1") {
        _mint(msg.sender, initialSupply/2);
        _mint(_dexTwo, initialSupply/2);
    }

    function approve(address owner, address spender, uint256 amount) public returns(bool){
        super._approve(owner, spender, amount);
  }
}

contract FakeToken2 is ERC20 {
    
    constructor(address _dexTwo, uint initialSupply) public ERC20("FKTOKEN2", "FKT2") {
        _mint(msg.sender, initialSupply/2);
        _mint(_dexTwo, initialSupply/2);
    }

    function approve(address owner, address spender, uint256 amount) public returns(bool){
        super._approve(owner, spender, amount);
  }
}





