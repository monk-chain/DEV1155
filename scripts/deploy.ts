import { ethers } from "hardhat";

async function main() {
  const DEV1155 = await ethers.getContractFactory("DEV1155");
  const NFTcontract = await DEV1155.deploy();

  await NFTcontract.deployed();
  console.log("DEV1155 address:", NFTcontract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
