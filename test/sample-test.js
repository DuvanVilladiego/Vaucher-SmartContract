const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Vauchers", function () {
  it("Should created a Vaucher event", async function () {
    const Vauchers = await ethers.getContractFactory("Vauchers");
    const vauchers = await Vauchers.deploy();
    await vauchers.deployed();

    const createVaucher = await vauchers.createVaucher("Hi","prueba","22-07-2027","https://tiermaker.com/images/templates/5475111597683142.jpg");
    const r = await createVaucher.wait();
    console.log(r)
    // const d = await vauchers.createVaucher("Hi","prueba","22-07-2027","https://tiermaker.com/images/templates/5475111597683142.jpg");
    // d.wait(console.log);
    
  });
});
