// contracts/interfaces/ICCIPRouter.sol placeholder

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICCIPRouter {
    function ccipSend(
        uint64 destinationChainSelector,
        bytes calldata message
    ) external payable returns (bytes32 messageId);
}
