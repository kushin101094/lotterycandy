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

LotteryCandy is a decentralized lottery game built on the blockchain, allowing users to participate in a unique and transparent lottery experience. Utilizing a custom communication channel, players can send packets between the Optimism layer and the Base chain, competing to achieve the fastest transmission times. After a predetermined period, the game will conclude, and the top 3 players with the quickest times will be declared winners.

## Features

- **Custom Packet Sending:** Engage in a unique lottery game by sending packets from Optimism to the Base chain and vice versa, aiming for the lowest transmission time.
- **Competitive Leaderboard:** Keep track of your ranking and compete against others in real-time as you strive for the top positions.
- **Transparent and Fair:** All transactions and results are recorded on the blockchain, ensuring a fair and transparent process.
- **Automatic Prizes:** Winners are automatically awarded prizes directly through smart contracts, ensuring immediate and secure distribution.

## Getting Started

### Prerequisites

- Ensure you have a Web3 wallet like MetaMask installed for interaction with the blockchain.
- Have a sufficient balance of ETH on Optimism for transaction fees and participating in the game.

### Installation and Setup

1. Clone the repository to your local environment.
git clone https://github.com/kushin101094/lotterycandy.git

csharp
Copy code

2. Navigate into the project directory.
cd lotterycandy

markdown
Copy code

3. Install dependencies.
npm install

markdown
Copy code

4. Compile the smart contracts.
truffle compile

css
Copy code

5. Deploy the contracts to the desired networks.
truffle migrate --network optimism
truffle migrate --network base

vbnet
Copy code

### How to Play

1. Connect your Web3 wallet to LotteryCandy through the dApp interface.
2. Use the dApp to send a packet from Optimism to the Base chain.
3. Your transmission time will be recorded and displayed on the leaderboard.
4. At the end of the competition period, check if you're among the top 3 for prize distribution.

## Smart Contracts

The LotteryCandy game logic is encapsulated within several Solidity smart contracts:

### PacketSender.sol

- Manages the packet sending functionality, tracking the timings of each transmission.

### GameLogic.sol

- Controls the game's logic, including the timing and calculation of winners based on their performance.

### PrizeDistribution.sol

- Handles the distribution of rewards to the game's winners in a transparent and secure manner.

## Contributing

We welcome contributions from the community! Please refer to our contributing guidelines for more information on how you can contribute to LotteryCandy.

## License

LotteryCandy is open source and available under the MIT License. See the [LICENSE](LICENSE)
