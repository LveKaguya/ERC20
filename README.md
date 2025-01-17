# ERC20
# ERC-20 Token Project

This project involves creating an ERC-20 token using Solidity and deploying it to the Sepolia testnet. The token is named after a university and group, following the assignment requirements for `Blockchain Technologies 1: Assignment 3, Part 1`.

## Features

- **ERC-20 Token Implementation:**
  - The token adheres to the ERC-20 standard.
  - Customizable name, symbol, and initial supply.

- **Deployment to Sepolia Testnet:**
  - The token is deployed on the Sepolia Ethereum testnet.
  - Interaction with the token is facilitated through Hardhat.

- **Transaction-Related Functions:**
  - Includes standard ERC-20 functions like `transfer`, `approve`, and `transferFrom`.
  - Additional features as required by the assignment.

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd <project-folder>
   ```

2. **Install Dependencies:**
   ```bash
   npm install
   ```

3. **Configure Environment Variables:**
   - Create a `.env` file in the root directory with the following variables:
     ```env
     SEPOLIA_URL=https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID
     PRIVATE_KEY=YOUR_PRIVATE_KEY
     ```
   - Replace `YOUR_INFURA_PROJECT_ID` with your Infura project ID or another RPC URL provider.
   - Replace `YOUR_PRIVATE_KEY` with the private key

4. **Compile the Smart Contract:**
   ```bash
   npx hardhat compile
   ```

5. **Deploy to Sepolia Testnet:**
   ```bash
   npx hardhat run scripts/deploy.js --network sepolia
   ```

## Interacting with the Token

- Use the Hardhat console to interact with the deployed token:
  ```bash
  npx hardhat console --network sepolia
  ```
- Example commands:
  ```javascript
  const Token = await ethers.getContractFactory("Token");
  const token = await Token.attach("<deployed-contract-address>");
  await token.balanceOf("<wallet-address>");
  ```

## Testing

- To run tests:
  ```bash
  npx hardhat test
  ```

## Project Structure

- `contracts/`
  - Contains the Solidity smart contract for the ERC-20 token.

- `scripts/`
  - Deployment scripts for the token.

- `test/`
  - Unit tests for the smart contract using Hardhat and Chai.

## Resources

- [ERC-20 Token Standard](https://eips.ethereum.org/EIPS/eip-20)
- [Hardhat Documentation](https://hardhat.org/docs)
- [Sepolia Faucet](https://sepoliafaucet.com/)
