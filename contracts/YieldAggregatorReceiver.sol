// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICCIPReceiver {
    function ccipReceive(bytes calldata message) external;
}

contract YieldAggregatorReceiver is ICCIPReceiver {
    address public owner;
    string public lastAction;

    event RebalanceExecuted(string action);

    constructor() {
        owner = msg.sender;
    }

    function ccipReceive(bytes calldata message) external override {
        string memory action = abi.decode(message, (string));
        lastAction = action;

        emit RebalanceExecuted(action);
    }
}
