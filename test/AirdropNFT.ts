import {
    time,
    loadFixture,
  } from "@nomicfoundation/hardhat-toolbox/network-helpers";
  import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
  import { expect } from "chai";
  import hre, { ethers } from "hardhat";

  describe("AirdropNFT", function () { 

    async function deployLoadFixture() {

        const _bayc = "0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D";
        const token = "";
        const merkleRoot = "";

        const [owner,addr1,addr2] = await hre.ethers.getSigners();

        const eligibleaddresses = addr1;
        
        const Merkle = await hre.ethers.getContractFactory("MerkleAirdrop");

        const merkle = await Merkle.deploy(_bayc,token,merkleRoot);

        return {}
        
    }

  })