// scripts/deploy.ts placeholder
import { ethers } from "hardhat";

async function main() {
  //Avalanche https://docs.chain.link/ccip/directory/mainnet/chain/avalanche-mainnet
  const CCIP_ROUTER = "0xF4c7E640EdA248ef95972845a62bdC74237805dB";
  const DEST_CHAIN_SELECTOR = 6433500567565415381;

  const Aggregator = await ethers.getContractFactory("YieldAggregator");
  const aggregator = await Aggregator.deploy(CCIP_ROUTER, DEST_CHAIN_SELECTOR);

  await aggregator.deployed();
  console.log("YieldAggregator deployed to:", aggregator.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
