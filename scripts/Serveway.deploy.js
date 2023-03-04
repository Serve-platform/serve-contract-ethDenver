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

// mumbai  SEAT : 0x1Ab49e94aB7A61f8574aA162fC89bB0cB0945629
// mumbai  SEAT2: 0x6516DF10bE522ea3B31D1FFB47B101b748160aB7
// mumbai  SEAT3: 0xA6f00218efb6c0Fe4C53d01b2195e09A1E1a8523
// mainnet SEAT :

// Token : 0xff1223A4Ef825D1B93c4E628BACB0a12A9917770
// Vault : 0xA76931943127ea133b0BD0732d0F0f6a4e5faEf7