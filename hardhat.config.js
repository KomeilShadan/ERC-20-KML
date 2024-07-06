require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: process.env.MORALIS_TESTNET_NODE,
      accounts: [process.env.PRIVATE_KEY]  
    }
  },
  etherscan: {
    apiKey: process.env.MORALIS_API_KEY
  }
};
