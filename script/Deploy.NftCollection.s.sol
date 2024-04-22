// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

import {NFTCollection} from "../src/NFTCollection.sol";
import {console2} from "forge-std/console2.sol";

contract ERC1155CollectionDeployScript is Script {
    address owner = makeAddr("owner");
    NFTCollection erc1155Collection;

    function run() public {
        HelperConfig helperConfig = new HelperConfig();

        (uint256 deployerKey) = helperConfig.activeNetworkConfig();
        vm.startBroadcast(deployerKey);
        erc1155Collection =
            new NFTCollection(owner, "ipfs://QmRaNapy2YG1iF8yywdJGn5BehDc4RyxxUMM49uK7D8MXv/", "Kyte Sprint", "SPRNT");
        console2.log("erc1155Collection deployed at : ", address(erc1155Collection));
        vm.stopBroadcast();
    }
}
