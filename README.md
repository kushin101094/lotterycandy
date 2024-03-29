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
## Usage: just do-it
do-it:
    echo "Running the full E2E flow..."
    just set-contracts optimism XCounter false && just set-contracts base XCounter false
    just deploy optimism base
    just sanity-check
    just create-channel
    just send-packet optimism
    echo "You've done it!"

init-game:
    echo "Script running init game..."
    just deploy optimism base
    just sanity-check
    just create-channel

start-game NUMBER_OF_CHALLENGE FORCE_START:
    echo "Script running starting game..."
    numberOfChallenge={{NUMBER_OF_CHALLENGE}} forceStart={{FORCE_START}} npx hardhat run games/start-game.js --network base

send-direction FROM:
    echo "Script running sending direction..."
    npx hardhat run games/send-direction.js --network {{FROM}}

get-winners IN_CHAIN:
    echo "Script running get winners..."
    npx hardhat run games/get-winners.js --network {{IN_CHAIN}}

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
