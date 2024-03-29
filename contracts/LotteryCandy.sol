//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import './base/CustomChanIbcApp.sol';

contract LotteryCandy is CustomChanIbcApp {
    // app specific state
    uint private nthGame = 0;
    uint private numberOfChallenge = 0;
    uint private numberOfWinners = 3;
    uint private currentChallenge = 0;
    mapping (uint => address[]) private joinedUsers;
    mapping (address => mapping(uint => bool)) private isJoinedGame; // address => nthGame => isJoined
    mapping (address => mapping(uint => mapping(uint => uint))) private userTimeChallengeMap; // address => nthGame => challenge => time

    event GameStarted(uint nthGame, uint numberOfChallenge, uint numberOfWinners);
    event GoNextChallenge(uint nthGame, uint currentChallenge);

    constructor(IbcDispatcher _dispatcher) CustomChanIbcApp(_dispatcher) {}

    // Game logic
    function startGame(
        uint _numberOfChallenge,
        bool _forceStart
    ) external {
        require(_forceStart || currentChallenge >= numberOfChallenge, "The game is not finished yet");
        nthGame++;
        numberOfChallenge = _numberOfChallenge;
        currentChallenge = 0;
        emit GameStarted(nthGame, numberOfChallenge, numberOfWinners);
    }

    function nextChallenge() external {
        require(currentChallenge < numberOfChallenge, "The game is finished");
        currentChallenge++;
        emit GoNextChallenge(nthGame, currentChallenge);
    }

    function getWinners() external view returns (address[] memory) {
        uint winnersCount = joinedUsers[nthGame].length < numberOfWinners ? joinedUsers[nthGame].length : numberOfWinners;
        address[] memory winners = new address[](winnersCount);
        for (uint i = 0; i < winnersCount; i++) {
            winners[i] = joinedUsers[nthGame][i];
        }
        return winners;
    }

    // IBC logic

    /**
     * @dev Sends a packet with the caller address over a specified channel.
     * @param channelId The ID of the channel (locally) to send the packet to.
     * @param timeoutSeconds The timeout in seconds (relative).
     */

    function sendPacket(
        bytes32 channelId,
        uint64 timeoutSeconds
    ) external {
        bytes memory payload = abi.encode(msg.sender);

        // setting the timeout timestamp at 10h from now
        uint64 timeoutTimestamp = uint64((block.timestamp + timeoutSeconds) * 1000000000);

        // calling the Dispatcher to send the packet
        dispatcher.sendPacket(channelId, payload, timeoutTimestamp);

        // track
        if (!isJoinedGame[msg.sender][nthGame]) {
            joinedUsers[nthGame].push(msg.sender);
            isJoinedGame[msg.sender][nthGame] = true;
        }
        userTimeChallengeMap[msg.sender][nthGame][currentChallenge] = block.timestamp;
    }

    /**
     * @dev Packet lifecycle callback that implements packet receipt logic and returns and acknowledgement packet.
     *      MUST be overriden by the inheriting contract.
     * 
     * @param packet the IBC packet encoded by the source and relayed by the relayer.
     */
    function onRecvPacket(IbcPacket memory packet) external override onlyIbcDispatcher returns (AckPacket memory ackPacket) {
        recvedPackets.push(packet);

        return AckPacket(true, abi.encode(0));

    }

    /**
     * @dev Packet lifecycle callback that implements packet acknowledgment logic.
     *      MUST be overriden by the inheriting contract.
     * 
     * @param ack the acknowledgment packet encoded by the destination and relayed by the relayer.
     */
    function onAcknowledgementPacket(IbcPacket calldata, AckPacket calldata ack) external override onlyIbcDispatcher {
        ackPackets.push(ack);
        
        (uint64 _counter) = abi.decode(ack.data, (uint64));
        
       
    }

    /**
     * @dev Packet lifecycle callback that implements packet receipt logic and return and acknowledgement packet.
     *      MUST be overriden by the inheriting contract.
     *      NOT SUPPORTED YET
     * 
     * @param packet the IBC packet encoded by the counterparty and relayed by the relayer
     */
    function onTimeoutPacket(IbcPacket calldata packet) external override onlyIbcDispatcher {
        timeoutPackets.push(packet);
        // do logic
    }
}
