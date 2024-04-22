// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";

import {NFTCollection} from "../src/NFTCollection.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {console2} from "forge-std/console2.sol";

contract DeployAndMintFromCollection is Script {
    function run() public {
        HelperConfig helperConfig = new HelperConfig();
        (uint256 deployerKey) = helperConfig.activeNetworkConfig();
        vm.startBroadcast(deployerKey);
        NFTCollection erc1155Collection = new NFTCollection(
            address(uint160(deployerKey)),
            "ipfs://QmRaNapy2YG1iF8yywdJGn5BehDc4RyxxUMM49uK7D8MXv/",
            "Kyte Sprint",
            "SPRNT"
        );
        console2.log("erc1155Collection deployed at : ", address(erc1155Collection));

        NFTCollection(erc1155Collection).mint(0, "");

        vm.stopBroadcast();
        // console.log("nft minted from collection 0 : ",collectionAddress);
    }
}
