import "./interfaces/ICCIPRouter.sol";

contract YieldAggregator {
    address public owner;
    ICCIPRouter public ccipRouter;
    uint64 public destinationChainSelector;

    constructor(address _router, uint64 _destChain) {
        owner = msg.sender;
        ccipRouter = ICCIPRouter(_router);
        destinationChainSelector = _destChain;
    }

    function rebalanceRemote(string calldata action) external {
        require(msg.sender == owner, "Only owner");

        bytes memory payload = abi.encode(action); // Example payload
        bytes32 messageId = ccipRouter.ccipSend(destinationChainSelector, payload);

        emit RebalanceTriggered(messageId, action);
    }

    event RebalanceTriggered(bytes32 messageId, string action);
}
