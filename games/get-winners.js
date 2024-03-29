// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require('hardhat');
const { getIbcApp } = require('../scripts/private/_vibc-helpers.js');

const numberOfChallenge = process.env.numberOfChallenge;
const forceStart = process.env.forceStart;
if (!numberOfChallenge || !forceStart) {
    console.error('Usage: just get-winners <from>');
    process.exit(1);
}

async function main() {
    const accounts = await hre.ethers.getSigners();

    const networkName = hre.network.name;
    // Get the contract type from the config and get the contract
    const ibcApp = await getIbcApp(networkName);
    
    console.log('Starting get winners...');
    const winners = await ibcApp.connect(accounts[0]).getWinners();
    console.log('Winners here: ');
    winners.forEach((address, index) => {
        console.log(`Address ${index + 1}: ${address}`);
    });
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});