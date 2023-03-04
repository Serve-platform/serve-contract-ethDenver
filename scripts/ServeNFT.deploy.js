const hre = require("hardhat");

async function main() {
  const ServeNFT = await hre.ethers.getContractFactory("ServeNFT");
  const serveNFT = await ServeNFT.deploy();

  await serveNFT.deployed();
  console.log("Contract deployed:", serveNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai  ServeNFT: 0x7c6A7fFb4837298bcD606B86A59958ed50b4d34F
// mainnet ServeNFT: