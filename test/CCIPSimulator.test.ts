import { ethers } from "hardhat";
import { expect } from "chai";

describe("CCIP Simulation", function () {
  it("should simulate a CCIP send and receive between sender and receiver", async function () {
    const [owner] = await ethers.getSigners();

    const Receiver = await ethers.getContractFactory("YieldAggregatorReceiver");
    const receiver = await Receiver.deploy();
    await receiver.deployed();

    const Sender = await ethers.getContractFactory("YieldAggregatorSender");
    const sender = await Sender.deploy(ethers.constants.AddressZero, 1234);
    await sender.deployed();

    const tx = await sender.simulateSend(receiver.address, "rebalance-ETH");
    await tx.wait();

    expect(await receiver.lastAction()).to.equal("rebalance-ETH");
  });
});
