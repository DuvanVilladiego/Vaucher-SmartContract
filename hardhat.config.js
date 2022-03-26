require("@nomiclabs/hardhat-waffle");

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

module.exports = {
  solidity: "0.8.7",
  networks: {
    rinkeby: {
      url: process.env.INFURA_PROJECT_URL, //Infura url with projectId
      accounts: [process.env.PK], // add the account that will deploy the contract (private key)
    },
  },
};
