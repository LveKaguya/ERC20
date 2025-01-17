async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contract with account:", deployer.address);
  
    const Token = await ethers.getContractFactory("UniversityGroupToken");
    const token = await Token.deploy();
    await token.deployed();
  
    console.log("Token deployed to:", token.address);
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  