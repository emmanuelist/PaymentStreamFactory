// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StreamFactory {
    struct Stream {
        address sender;
        address recipient;
        uint256 amount;
        uint256 startTime;
        uint256 duration;
        bool isActive;
    }

    mapping(uint256 => Stream) public streams;
    uint256 public nextStreamId;

    function createStream(
        address recipient,
        uint256 amount,
        uint256 duration
    ) external returns (uint256) {
        require(amount > 0, "Amount must be positive");
        
        uint256 streamId = nextStreamId++;
        streams[streamId] = Stream({
            sender: msg.sender,
            recipient: recipient,
            amount: amount,
            startTime: block.timestamp,
            duration: duration,
            isActive: true
        });

        return streamId;
    }
}