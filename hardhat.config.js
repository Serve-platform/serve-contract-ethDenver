require("@nomicfoundation/hardhat-toolbox");

const dotenv = require('dotenv');
const fs = require('fs');

const config = dotenv.parse(fs.readFileSync('.env'));

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.18",
    settings: {
      optimizer: {
        enabled: true,
        runs: 500,
      },
    },
  },
  networks: {
    mumbai: {
      url: config.mumbaiUrl,
      accounts: [config.account2priv]
    },
    mainnet: {
      url: config.mainnetUrl,
      accounts: [config.account2priv]
    }
  },
  etherscan: {
    apiKey: config.polygonApiKey
  }
};
