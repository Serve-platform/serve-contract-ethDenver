const hre = require("hardhat");

async function main() {
  const Serveway = await hre.ethers.getContractFactory("Serveway");
  const serveway = await Serveway.deploy();

  await serveway.deployed();
  console.log("Contract deployed:", serveway.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai  SEAT: 0x1Ab49e94aB7A61f8574aA162fC89bB0cB0945629
// mainnet SEAT: