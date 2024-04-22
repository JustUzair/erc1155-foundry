// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";

import {NFTCollection} from "../src/NFTCollection.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {console2} from "forge-std/console2.sol";

contract MintFromCollection is Script {
    function run() public {
        address erc1155CollectionAddress = address(0x1F311df9cFff2CA6990e96E377EAaBa540621b92); // this is op sepolia testnet address only. replace with other to
        HelperConfig helperConfig = new HelperConfig();
        (uint256 deployerKey) = helperConfig.activeNetworkConfig();
        vm.startBroadcast(deployerKey);
        NFTCollection erc1155Collection = NFTCollection(erc1155CollectionAddress);
        NFTCollection(erc1155Collection).mint(1, "");

        vm.stopBroadcast();
        // console.log("nft minted from collection 0 : ",collectionAddress);
    }
}
