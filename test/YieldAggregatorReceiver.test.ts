import { ethers } from "hardhat";
import { expect } from "chai";

describe("YieldAggregatorReceiver", function () {
  it("should receive a rebalance message and store it", async function () {
    const [owner, sender] = await ethers.getSigners();

    const Receiver = await ethers.getContractFactory("YieldAggregatorReceiver");
    const receiver = await Receiver.deploy(sender.address);
    await receiver.deployed();

    const message = ethers.utils.defaultAbiCoder.encode(["string"], ["rebalance-ETH"]);
    await receiver.connect(sender).ccipReceive(message);

    expect(await receiver.lastAction()).to.equal("rebalance-ETH");
  });
});
