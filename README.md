# Cross-Chain Yield Aggregator (Hardhat)

This is a project for a cross-chain yield aggregator using Chainlink CCIP, Automation, and Data Feeds.

## Problem
Users have to manually manage yield strategies across multiple chains like Ethereum, Arbitrum, Avalanche, etc.

## Solution
This is a protocol that:
- Automatically rebalances user funds across chains to get the highest yield.
- Uses Chainlink CCIP to move funds securely between chains.
- Uses Chainlink Automation to trigger rebalancing based on yield thresholds.
- Uses Chainlink Data Feeds to monitor APY and token prices.

## Chainlink Services Used
- CCIP for cross-chain transfers
- Automation for rebalancing
- Data Feeds for APY comparison

## Features
- Smart contract to deposit and rebalance funds
- Interfaces for yield protocols and CCIP
- Scripts to deploy and simulate rebalance
- Tests scaffold

## Requirements
- Node.js
- Hardhat
- dotenv

## Getting Started

```bash
npm install
npx hardhat compile
npx hardhat test
```
