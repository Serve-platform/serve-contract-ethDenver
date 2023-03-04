const hre = require("hardhat");

async function main() {
  const SigVerifier = await hre.ethers.getContractFactory("SigVerifier");
  const sigVerifier = await SigVerifier.deploy();

  await sigVerifier.deployed();
  console.log("Contract deployed:", sigVerifier.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai  SigVerifier : 0x0c4F83D043ec305F3E079302DB0B879360184BF6
// mumbai  SigVerifier2: 0x1b5f0B433E4a30F0C40c259332187CC354f9FA59
// mainnet SigVerifier3: 0x563699d8798A654ec60A8F7720Fe8a0037ce69ae