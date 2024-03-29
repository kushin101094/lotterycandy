# Lottery Candy Contracts
#  Quest-Into-The-Polyverse-Phase-1 : Cross-chain Raffle Proof System



# Team Members
  @kushin101094 - Lead Developer

## Overview

LotteryCandy is a decentralized lottery game built on the blockchain, allowing users to participate in a unique and transparent lottery experience. Utilizing a custom communication channel, players can send packets between the Optimism layer and the Base chain, competing to achieve the fastest transmission times. After a predetermined period, the game will conclude, and the top 3 players with the quickest times will be declared winners.

## Features

- **Custom Packet Sending:** Engage in a unique lottery game by sending packets from Optimism to the Base chain and vice versa, aiming for the lowest transmission time.
- **Transparent and Fair:** All transactions and results are recorded on the blockchain, ensuring a fair and transparent process.
- **Automatic Prizes:** Winners are automatically awarded prizes directly through smart contracts, ensuring immediate and secure distribution.

## Getting Started

### Prerequisites

- Ensure you have a Web3 wallet like MetaMask installed for interaction with the blockchain.
- Have a sufficient balance of ETH on Optimism for transaction fees and participating in the game.

### Installation and Setup

 Clone the repository to your local environment.
git clone https://github.com/kushin101094/lotterycandy.git

After cloning the repo, install dependencies:
```bash
just install
```
After cloning the repository and navigating into the project directory, follow these steps to initialize the project and start using the LotteryCandy game.

## Installation and Setup

After cloning the repository and navigating into the project directory, follow these steps to initialize the project and start using the LotteryCandy game.

csharp
Copy code
## Installation and Setup

After cloning the repository and navigating into the project directory, follow these steps to initialize the project and start using the LotteryCandy game.

### Initialize Project

To set up your environment and initialize the game, run the following commands:

echo "Running the full E2E flow..."
just set-contracts optimism XCounter false && just set-contracts base XCounter false
just deploy optimism base
just sanity-check
just create-channel
just send-packet optimism
echo "You've done it!"
vbnet
Copy code

This script performs a series of actions to prepare your project for use:

- Sets up the contracts on both the Optimism and Base chains.
- Deploys necessary contracts.
- Performs a sanity check to ensure everything is set up correctly.
- Creates the communication channel between Optimism and Base.
- Sends a test packet from Optimism to demonstrate functionality.

### Initiate Game

To start the game and allow users to participate, use the `init-game` script:

echo "Script running init game..."
just deploy optimism base
just sanity-check
just create-channel

vbnet
Copy code

This prepares the game for a new round by deploying contracts, checking the system's sanity, and establishing the necessary communication channels.

## Send Packet Lottery

### Start Game

To begin a game round, specifying the number of challenges and whether to force start, execute:

echo "Script running starting game..."
numberOfChallenge={NUMBER_OF_CHALLENGE} forceStart={FORCE_START} npx hardhat run games/start-game.js --network base

css
Copy code

Replace `{NUMBER_OF_CHALLENGE}` and `{FORCE_START}` with the desired number of challenges and a boolean value to force start the game, respectively.

### Send Direction

To participate in the game by sending a packet in a specific direction, use:

echo "Script running sending direction..."
npx hardhat run games/send-direction.js --network {FROM}

vbnet
Copy code

Replace `{FROM}` with the network from which you're sending the packet (e.g., `optimism`).

## Get Top 3 Users

After the game round concludes, to retrieve the top 3 winners, execute:

echo "Script running get winners..."
npx hardhat run games/get-winners.js --network {IN_CHAIN}

csharp
Copy code

Replace `{IN_CHAIN}` with the chain on which you want to query for winners (e.g., `base`).

These detailed instructions will guide users through the process of setting up, p
### How to Play

1. Connect your Web3 wallet to LotteryCandy through the dApp interface.
2. Use the dApp to send a packet from Optimism to the Base chain.
3. Your transmission time will be recorded and displayed on the leaderboard.
4. At the end of the competition period, check if you're among the top 3 for prize distribution.

## Proof of Testnet Interaction


## Contributing

We welcome contributions from the community! Please refer to our contributing guidelines for more information on how you can contribute to LotteryCandy.

## License

LotteryCandy is open source and available under the MIT License. See the [LICENSE](LICENSE)
