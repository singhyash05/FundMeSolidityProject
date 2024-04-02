# FundMeSolidityProject
This repository contains the source code for Crowdfunding project.

# FundMe Contract

This is a Solidity smart contract for managing a funding pool where individuals can contribute funds in Ether (ETH). The contract ensures that contributions meet a minimum threshold, tracks contributors and their contributions, and allows the owner to withdraw collected funds.

## SPDX-License-Identifier

This contract is licensed under the MIT License.

## Prerequisites

- Solidity Compiler version 0.8.0 or higher
- `ethToUSD.sol` file for converting Ether to USD

## Installation

1. Clone this repository.
2. Compile the contract using the Solidity compiler.
3. Deploy the compiled contract to a compatible Ethereum blockchain network.

## Usage

### Functions

1. **fund():**
   - Allows users to contribute funds in Ether to the contract.
   - Requires the contributed amount to be greater than or equal to the minimum amount specified (20 USD).
   - Converts the received Ether amount to USD before recording the contribution.

2. **withdrawFunds():**
   - Allows the owner (manager) to withdraw all the funds collected in the contract.
   - Transfers the entire balance of the contract to the owner's address.
   - Clears the list of funders and resets their contribution amounts.

3. **getEthAmountInUsd(uint256 ethers):**
   - Accepts an amount in Ether and returns its equivalent value in USD.

### Modifiers

- **onlyOwner:**
  - Ensures that only the manager (contract owner) can execute certain functions.

### Receive and Fallback Functions

- **receive():**
  - Automatically called when Ether is sent to the contract.
  - Redirects the received Ether to the `fund()` function.

- **fallback():**
  - Same as `receive()` function to capture any fallback calls.


import "./ethToUSD.sol";

contract FundMe {
    // Contract state variables and functions
}
