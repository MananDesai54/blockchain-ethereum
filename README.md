# ethereum-and-solidity

Learning Blockchain and crypto

# Important link

- [Anders Block chain](https://andersbrownworth.com/blockchain/hash)
- [Ether scan](https://etherscan.io)
- [Dapp UniverSity](https://www.dappuniversity.com/)

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
```

# buzz words

- ABI = Application Binary Interface

# Solidity Knowledge

- Solidity has global variable called msg (msg.sender). it returns the senderId of user who called the function
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
- address (to store ethereum address)
- Struct (to create custom data type)
- Arrays (int[], uint[], string[], etc..), push to add element
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
