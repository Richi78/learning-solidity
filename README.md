
# Simple Storage

This project is a Foundry and Solidity practice app for learning the basics of smart contracts, local deployment, and reading/writing state on an EVM network.

## What I built

I followed the tutorial done by Cyfrin Audits, implemented a main storage contract called `SimpleStorage` that saves a favorite number, keeps a list of people, and stores a mapping between names and favorite numbers. I also created an inherited contract, `AddFiveStorage`, which overrides the store function and adds 5 to the value it receives. In addition, I added `StorageFactory` to deploy multiple `SimpleStorage` instances and read their values.

## What I am learning

Basics of solidity like types, contracts, inheritance, memory usage, gas.  

I am also learning how to work with Foundry, compile contracts with `forge build`, interact with read and write functions using `cast call` and `cast send`, and manage sensitive values through a `.env` file instead of writing credentials directly in commands using a ETH node called Anvil.

## `.env` setup

Create a `.env` file in the project root with your variables:

```shell
RPC_URL=https://127.0.0.1:8545
PRIVATE_KEY=0xPRIVATE_KEY_PROVIDED_BY_ANVIL
PRIVATE_KEY_2=0xANOTHER_PRIVATE_KEY_PROVIDED_BY_ANVIL
CONTRACT_ADDRESS=0xCONTRACT_ADDRESS
```

Load the variables in your shell before running the commands, in my case git bash:

```shell
source .env

```

## Useful commands

### Compile

```shell
forge build
```

### Deploy
```shell
forge script script/Deploy.s.sol --rpc-url $RPC_URL --broadcast
```

### Read data with `cast call`

Check the stored favorite number:

```shell
cast call $CONTRACT_ADDRESS "retrieve()(uint256)" --rpc-url $RPC_URL
```

Check the contract name:

```shell
cast call $CONTRACT_ADDRESS "name()(string)" --rpc-url $RPC_URL
```

### Write data with `cast send`

Store a new favorite number:

```shell
cast send $CONTRACT_ADDRESS "store(uint256)" 42 --rpc-url $RPC_URL --private-key $PRIVATE_KEY_2
```

Add a person:

```shell
cast send $CONTRACT_ADDRESS "addPerson(string,uint256)" "Ana" 7 --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

## Recommended workflow

1. Compile the project with `forge build`.
2. Load the variables from `.env` in your terminal.
3. Use `cast call` to read contract state.
4. Use `cast send` to submit transactions and update the state.

