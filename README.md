# Lottery Candy Contracts
#  Quest-Into-The-Polyverse-Phase-1 : Cross-chain Raffle Proof System



# Team Members
  @kushin101094 - Lead Developer

  @Nguyenlead - Developer
  @anhvietly- Developer
  @Lethanhquang12 - Developer
  @Letantai228 - Developer
  @DuNGuyen1003 - Developer
## Overview

Optimism-Base Lottery Game is a decentralized application (dApp) designed to provide a fun and competitive lottery experience, utilizing the power of blockchain technology to ensure transparency and fairness. This game allows users to send packets between Optimism and the Base chain via a custom channel, with the goal of achieving the shortest transmission time. After a specified period, the contract owner announces the top 3 winners who have managed to send their packets in the least amount of time.

## Features

- **Packet Sending:** Users can send packets from Optimism to the Base chain, utilizing a custom communication channel designed for efficiency and speed.
- **Leaderboard:** The dApp automatically updates a leaderboard displaying users with the shortest packet transmission times, fostering a competitive environment.
- **Transparent Selection:** The selection of winners is conducted in a transparent manner, with the smart contract code available for public review.
- **Reward Distribution:** Winners are rewarded with prizes, distributed automatically by the smart contract upon the conclusion of each lottery round.

## Getting Started

### Prerequisites

- MetaMask or any other compatible Web3 wallet installed.
- Sufficient ETH in Optimism for transaction fees and packet sending.

### Installation

1. Clone this repository to your local machine.
git clone https://github.com/yourusername/optimism-base-lottery-game.git

markdown
Copy code

2. Install the necessary dependencies.
cd optimism-base-lottery-game
npm install

markdown
Copy code

3. Compile the smart contracts.
truffle compile

css
Copy code

4. Deploy the contracts to the Optimism and Base chain.
truffle migrate --network optimism
truffle migrate --network base

vbnet
Copy code

### Usage

To participate in the lottery game, follow these steps:

1. Connect your Web3 wallet to the dApp.
2. Send a packet from Optimism to the Base chain using the dApp's interface.
3. Monitor the leaderboard for real-time updates on your ranking.
4. Wait for the lottery round to conclude and for the winners to be announced.

## Smart Contracts

The core logic of the Optimism-Base Lottery Game is implemented in Solidity smart contracts. Below is a high-level overview of the main contracts:

### PacketSender.sol

- Handles the logic for users to send packets between Optimism and the Base chain.
- Records the timestamps of each packet transmission.

### LotteryManager.sol

- Manages the game rounds, including starting and ending each round.
- Calculates the top 3 shortest transmission times and declares the winners.

### RewardDistributor.sol

- Distributes rewards to the winners based on their rankings.

## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for more information on how to contribute.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
