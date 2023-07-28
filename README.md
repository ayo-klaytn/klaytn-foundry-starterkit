Klaytn Foundry Starter Kit is a code sample that shows developers how to build, compile, test and deploy smart contracts using the blazing fast development framework, Foundry. 

## Getting Started
### Requirements
Please install the following:

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
    * You can test successful installation by running git --version
* [Foundry / Foundryup](https://book.getfoundry.sh/getting-started/installation)
    * Install forge, cast, and anvil
    * You can test you've installed them right by running forge --version and get an output like: forge 0.2.0 (0e33b3e 2023-07-28T00:23:39.362605000Z)
    * To get the an updated version of each, just run foundryup.

## Quickstart

```bash
git clone https://github.com/ayo-klaytn/klaytn-foundry-starterkit
cd klaytn-foundry-starterkit
forge insatall
```

## Compile

```bash
forge build
```

## Testing

```bash
forge test
```
## Deploying to a network

Deploying to a network uses the [foundry scripting system](https://book.getfoundry.sh/tutorials/solidity-scripting), where you write your deploy scripts in solidity!

### Setup
We'll demo using the Klaytn Baobab testnet. (request test KLAY [here](https://baobab.wallet.klaytn.foundation/faucet).)

You'll need to add the following variables to a .env file:

BAOBAB_RPC_URL: A URL to connect to the blockchain. You can get one for free from one of the supported [endpoint providers](https://docs.klaytn.foundation/content/dapp/json-rpc/public-en).

PRIVATE_KEY: A private key from your wallet. You can get a private key from a new Metamask account.

### Deploying
Run the command below to deploy to the blockchain

```bash
# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/SCRIPT_FILE_NAME:SCRIPT_CONTRACT_NAME --rpc-url $BAOBAB_RPC_URL --broadcast --skip-simulation -vvvv
```

For example:

```bash
# deploy airdropKIP17.sol
forge script script/airdropKIP7.s.sol:KIP7AirdropDeployScript --rpc-url $BAOBAB_RPC_URL --broadcast --skip-simulation -vvvv

# deploy airdropKIP17.sol
forge script script/airdropKIP17.s.sol:KIP17AirdropDeployScript --rpc-url $BAOBAB_RPC_URL --broadcast --skip-simulation -vvvv

# deploy KIP37MultiToken.sol
forge script script/KIP37MultiToken.s.sol:KIP37MultiTokenDeployScript --rpc-url $BAOBAB_RPC_URL --broadcast --skip-simulation -vvvv

```

## Working with a local network
Foundry comes with local network anvil baked in, and allows us to deploy to our local network for quick testing locally.

To start a local network run:

```bash
anvil
```

Update your .env file with a private key given to you by Anvil.

Then run the following script:

```bash
forge script script/NFT.s.sol:MyScript --fork-url http://localhost:8545 --broadcast
```



