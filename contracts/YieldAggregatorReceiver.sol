// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICCIPReceiver {
    function ccipReceive(bytes calldata message) external;
}

contract YieldAggregatorReceiver is ICCIPReceiver {
    address public owner;
    string public lastAction;
    address public allowedSender;

    constructor(address _allowedSender) {
        owner = msg.sender;
        allowedSender = _allowedSender;
    }

    function ccipReceive(bytes calldata message) external override {
        require(msg.sender == allowedSender, "Not authorized sender");
        string memory action = abi.decode(message, (string));
        lastAction = action;

        emit RebalanceReceived(action);
    }

    event RebalanceReceived(string action);
}
