import {
    time,
    loadFixture,
  } from "@nomicfoundation/hardhat-toolbox/network-helpers";
  import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
  import { expect } from "chai";
  import hre, { ethers } from "hardhat";

  describe("AirdropNFT", function () { 

    async function deployLoadFixture() {

        const [owner,addr1,addr2] = await hre.ethers.getSigners();

        const eligibleaddresses = addr1;
        
        const MerkleAirdrop = await hre.ethers.getContractAt("MerkleAirdrop")
        
    }

  })