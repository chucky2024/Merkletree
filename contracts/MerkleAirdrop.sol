// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract MerkleAirdrop is Ownable {
    bytes32 public merkleRoot;
    IERC20 public token;
    IERC721 public bayc;

    mapping(address => bool) public claimed;

    constructor(address _token, address _bayc, bytes32 _merkleRoot)Ownable(msg.sender) {
        token = IERC20(_token);
        bayc = IERC721(_bayc);
        merkleRoot = _merkleRoot;
    }

    function claim(bytes32[] calldata proof) external {
        require(!claimed[msg.sender], "Already claimed");
        require(IERC721(bayc).balanceOf(msg.sender) > 1,"Nawa for U ooo!");
        require(isEligible(msg.sender, proof), "Hmmm, eligible ko,eligible ni! Mtchhheeeww");

        claimed[msg.sender] = true;

        //using a fixed airdrop amount
        uint256 airdropAmount = 100 * 10**18; // 100 tokens
        require(token.transfer(msg.sender, airdropAmount), "Transfer failed");
    }

    function isEligible(address account, bytes32[] calldata proof) internal view returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(account));
        return MerkleProof.verify(proof, merkleRoot, leaf);
    }
}
