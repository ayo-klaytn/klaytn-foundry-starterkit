// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NFT.sol";

contract CounterTest is Test {
    NFT public nft;

    uint amount = 80000000000000000;

    function setUp() public {
        nft = new NFT("nft", "sNft", "");
        hoax(address(2), 100 ether);
        nft.mintTo{ value: amount }(address(2));
    }

    function test_IncrementAsMinter() public {
        assertEq(nft.balanceOf(address(2)), 1);
    }
}
