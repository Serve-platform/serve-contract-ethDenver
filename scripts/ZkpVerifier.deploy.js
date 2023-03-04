const hre = require("hardhat");

async function main() {
  const ZkpVerifier = await hre.ethers.getContractFactory("ZkpVerifier");
  const zkpVerifier = await ZkpVerifier.deploy();

  await zkpVerifier.deployed();
  console.log("Contract deployed:", zkpVerifier.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai  zkpVerifier : 0xDA218c923bcA169169D4aD0576653a223a3A4E04