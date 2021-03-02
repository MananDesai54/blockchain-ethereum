# ethereum-and-solidity

Learning Blockchain and crypto

- 0.001 ether = 1000000000000000 wei

# Important link

- [Anders Block chain](https://andersbrownworth.com/blockchain/hash)
- [Ether scan](https://etherscan.io)
- [Dapp UniverSity](https://www.dappuniversity.com/)
- [Ether to other(wie etc) Converter](https://etherconverter.netlify.app/)
- [Gas Price](https://docs.google.com/spreadsheets/d/1n6mRqkBz3iWcOlRem_mO09GtSKEKrAsfO7Frgx18pNU/edit#gid=0)
- [Blockchain.com](https://www.blockchain.com/)
- [Mnemonics](https://iancoleman.io/bip39/)
- [Ether Scan](https://rinkeby.etherscan.io/)

# What we used

- web3.js
- solc.js
- ganache-cli
- mocha.js
- infura
- remix editor
- Meta mask
- ethereum
- rinkeby, main etc network

# Videos to watch

- Stephen Grinder on Udemy
- Dapp University
- Buffalo University on course era
- Telusko for introduction

# notes

- Topics

```md
- Blockchain
- Crypto currency
- Cryptography
- ethereum
- mining
- block time
- transaction
- why transaction take more time
- hash
- solidity - to create smart contracts
- smart contracts
- remix editor
- gasPrice: per gas wie amount
- startGas/gasLimit: max amount gas to be used
- connecting with front-end
```

- Mining: Finding nonce value

# buzz words

- ABI = Application Binary Interface

# Solidity Knowledge

- Solidity has global variable called msg { sender, value, data, gas }
- Solidity has global variable called block { difficulty, timeout , ... }
- constructor runs when smart contracts are deployed to block chain

1. Function Types

```md
- public : Anyone can use
- private : Only this contract can use
- view : only returns value doesn't modify any
- constant : same as above
- pure : doesn't modify or read contract's data
- payable : while calling this function sender might sind ether along with it
```

2. Data Types

```md
- int, uint, uint256, etc..
- string, byte32, etc..
- bool
- fixed/ ufixed (2.20, -3.14)
- address (to store ethereum address)
- Struct (to create custom data type)
- Arrays (int[], uint[], string[], etc..), push to add element
- Fixed Array (int[3] = [1,2,3]), Dynamic Array((int[] = [1,2,3]))
- 2d arrays
- Mappings = for more complex data
  e.x:
  mapping(uint => string) public names;
  names[1] = "Hello";
  names[2] = "World";
  - Nested Mapping (like storing data for particular ethereum account/user)
    e.x: mapping(address => mapping(unit => string)) myMapping;
    myMapping[1345][1] = {...myData}
```

3. Conditionals and Loops

```md
- if, else regular
- for loop regular
```

4. Events
5. Modifiers
6. Enums
7. Ether payment
8. Inheritance : by using is
9. Factories : creating contracts from other contracts
10. Smart contract interaction
