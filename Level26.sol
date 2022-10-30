//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}


contract DetectionBot {
    IForta forta;
    address cryptoVault;

    constructor(address _forta, address _cryptoVault) public {
        forta = IForta(_forta);
        cryptoVault = _cryptoVault;
    } 

    function handleTransaction(address _user, bytes memory _msgData) public {
        bytes20 origSender;
        // parse origSender and require that the origSender is not the cryptovault address 
        assembly {
            calldatacopy(0x0, 180, 20) // found the offset 180 by just counting LOL
            origSender := mload(0x0)
        }
        
        // origSender == cryptovault address
        if (address(origSender) == cryptoVault) { 
            forta.raiseAlert(_user);
        } 


        // Legacy tokens transfer function is malicious since it calls the underlying token function 
        // that then calls _transfer function and it is the onw from DET ERC20 context since legacy is 
        // not using .delegatecall

        // if something is malicious
        // forta.raiseAlert(user)

    }


}






