// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICCIPRouter {
    function ccipSend(uint64 destinationChainSelector, bytes calldata message) external returns (bytes32);
}

contract YieldAggregatorSender {
    address public owner;
    address public router;
    uint64 public destinationChain;

    event MessageSent(bytes32 messageId, string action);

    constructor(address _router, uint64 _destinationChain) {
        owner = msg.sender;
        router = _router;
        destinationChain = _destinationChain;
    }

    function simulateSend(address receiver, string calldata action) external {
        require(msg.sender == owner, "Only owner can send");

        bytes memory payload = abi.encode(action);
        // Simulate message ID
        bytes32 messageId = keccak256(abi.encodePacked(block.timestamp, action));

        // In actual CCIP this would be:
        // ICCIPRouter(router).ccipSend(destinationChain, payload);

        emit MessageSent(messageId, action);

        // Simulate the router calling the receiver directly
        (bool success, ) = receiver.call(
            abi.encodeWithSignature("ccipReceive(bytes)", payload)
        );
        require(success, "Simulated call failed");
    }
}
