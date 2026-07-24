//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "forge-std/Script.sol";
import "src/SimpleStorage.sol";

contract DeploySimpleStorage is Script{
  function run() external {
    uint256 privateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(privateKey);

    SimpleStorage simpleStorage = new SimpleStorage();
    
    console.log("SimpleStorage deployed at:");
    console.log(address(simpleStorage));
    vm.stopBroadcast();
  }
}