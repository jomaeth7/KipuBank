// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/KipuBank.sol";

contract DeployKipuBank is Script {
    function run() external {
        vm.startBroadcast();

        // Academic-friendly limits
        uint256 withdrawLimit = 0.01 ether; // Máximo retiro por transacción: 0.01 ETH
        uint256 bankCap = 0.1 ether;        // Límite global de depósitos: 0.1 ETH

        new KipuBank(withdrawLimit, bankCap);

        vm.stopBroadcast();
    }
}
