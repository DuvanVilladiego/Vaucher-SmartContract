const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners(); 

  console.log("Deploying contracts with the account:", deployer.address); 

  const Vauchers = await hre.ethers.getContractFactory("Vauchers");
  const vauchers = await Vauchers.deploy("EventVaucher", "EV");

  await vauchers.deployed();

  console.log("Mint deployed to:", vauchers.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
