# Degen ERC20 Token 
## Description
DegenToken (DGN) is a custom ERC20 token using Solidity, built on the Ethereum blockchain and deployable on other networks like Avalanche and its functionalities can be traced on ```testnet snowtrace.io```. This token includes features such as minting, burning, penalties for certain actions, and a redeem option.
## Features
1. ERC20 Standard: Uses certain  ERC20 libraries , for using some built in functions.
2. Penalty System: Apply penalties to users by reducing their token balance. Can be applied if player shows abusive behaviour during gameplay or leaves game in between.
3. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
4. Burnable: Tokens can be burned (destroyed), reducing the total supply.
5. Ownable: Ownership management to restrict certain functions to the contract owner.

## Video Explanation 
https://www.loom.com/share/98f9ede6d0994b4abe3a09d14827da28
## How to run this program
 1. Clone this repository https://github.com/Deveshsingh21/Degen_Token_ERC20_Module_4/new/main?filename=README.md edit thislater  in VsCode or any other compatible Environment , You can also use ```remix.ethereum``` to deploy this contract.
 2. When Working on Vs Code you need to run certain commands on terminal ```npm install```,```npx hardhat compile```, ```npx hardhat run deploy.js --network fuji``` to deploy the Contract on C-Chain Network.
 3. For Deploying on Avalanche you need some AVAX , you can get it on ```AvalancheTestnetFaucet```.
 4. Connect to the Fuji testnet on testnet.snowtrace.io.
 5. Compile and deploy the smart contract: using commands mnetioned in step 2.
 6. Copy the deployed contract address and paste it into testnet.snowtrace.io to verify the contract.
 7. Open Remix IDE and navigate to the Deploy and Run Transactions section.
 8. elect ```Injected Provider: MetaMask``` in the dropdown and set the owner account.
 9. Click On Deploy Button and You are Ready to use all the functionalities of your Contract.

## Authors 
Deveshsingh21 deveshsingh5603@gmail.com
Metacrafters

## License
This project is licensed under the MIT License.

   


