# ethereum-and-solidity

Learning Blockchain and crypto

- 0.001 ether = 1000000000000000 wei

# Type of tokens 
- ERC55
	- ERC-1155 is a unique token that supports non-fungible (NFTs) and fungible tokens. It's faster and more efficient to use in batch token transfers. Developed by Enjin, it is called, “the next generation multi-token standard.” ERC-1155 can use a single contract to make various types of NFTs.
# Bugs

- getting value of storage variable or returned variable is empty array why?

# Important link

- [Anders Block chain](https://andersbrownworth.com/blockchain/hash)
- [Ether scan](https://etherscan.io)
- [Dapp UniverSity](https://www.dappuniversity.com/)
- [Ether to other(wie etc) Converter](https://etherconverter.netlify.app/)
- [Gas Price](https://docs.google.com/spreadsheets/d/1n6mRqkBz3iWcOlRem_mO09GtSKEKrAsfO7Frgx18pNU/edit#gid=0)
- [Blockchain.com](https://www.blockchain.com/)
- [Mnemonics](https://iancoleman.io/bip39/)
- [Ether Scan](https://rinkeby.etherscan.io/)
- Nourini - https://www.youtube.com/watch?v=MMZGQSWD4tU
- Krugman - https://www.youtube.com/watch?v=Y_IYGeZLLhI



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

# IPFS - InterPlanetary File System
- IPFS is a distributed system for storing and accessing files, websites, applications, and data. IPFS is a peer-to-peer (p2p) storage network.
- About IPFS
  - Decentralized
  - Content is accessible through peers located anywhere in the world, that might relay information, store it, or do both. Thus it gives the following advantages.
  - Reliability
  - Makes it harder to censor content
  - Faster than centralized as you get it from a peer near to your location
  - Available all the time
  - Uses Content Addressing instead of location addressing
	- Traditional URLs and file paths are based on Location addressing which means that the URLs or Paths are based on WHERE the content resides.
	- Example: 
    - https://en.wikipedia.org/wiki/Aardvark/Users/Alice/Documents/term_paper.doc
    - C:\Users\Joe\My Documents\project_sprint_presentation.ppt
	- IPFS uses Content Addressing. Here a hash is created using algorithms like sha2-256 from the Content & Metadata of Content. Now they uses same hash as the URL which can be looked upon by appending it to the IPFS gateway i.e, https://ipfs.io
  - Example: The Wikipedia page https://en.wikipedia.org/wiki/Aardvark is also available in IPFS as following ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Aardvark.html
  - You can search for the link given below to get the same source from IPFS.
https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Aardvark.html
  - However, hash values are generated according to content, still IPFS can manage to show updated(changed) content with the same hash value. IPFS does it using IPNS, Mutable File System (MFS), and DNSLink.

# Participation
- IPFS is based on the ideas of possession and participation, where many people possess each others' files and participate in making them available.
- That means IPFS only works well when people are actively participating. If you use your computer to share files using IPFS, but then you turn your computer off, other people won't be able to get those files from you anymore. But if you or others make sure that copies of those files are stored on more than one computer that's powered on and running IPFS, those files will be more reliably available to other IPFS users who want them. This happens to some extent automatically: by default, your computer shares a file with others for a limited time after you've downloaded it using IPFS. You can also make content available more permanently by pinning it, which saves it to your computer and makes it available on the IPFS network until you decide to unpin it. (You can learn more about this in the guide to persistence and pinning.)

# Working with IPFS

- you could either initialize js-ipfs in the browser on your own, or host your own node locally by installing IPFS and running a daemon in your terminal. When you're ready to experiment with that, you can visit the IPFS docs site to learn how to install IPFS and initialize your node.

- Note: The js-ipfs library is in Alpha state.The codebase hasn't been audited by security specialists and it shouldn't be used to store, share or publish sensitive information.

- While development Js-ipfs-http-client library is used for interacting with IPFS

# Creating Private IPFS network
- Following links can be used to know how to create an ipfs private network:
- https://medium.com/@s_van_laar/deploy-a-private-ipfs-network-on-ubuntu-in-5-steps-5aad95f7261b

- https://labs.eleks.com/2019/03/ipfs-network-data-replication.html


# Smart Contract
- Description
    - A smart contract is a computer program or a transaction protocol which is intended to automatically execute, control or document legally relevant events and actions according to the terms of a contract or an agreement.

# Metamask : 
- MetaMask is a browser plugin, available as the MetaMask Chrome extension or Firefox Add-on. At its core, it serves as an Ethereum wallet: By installing it, you will get access to a unique Ethereum public address, with which you can start sending and receiving ether or tokens.
- It allows users to store and manage account keys, broadcast transactions, send and receive Ethereum-based cryptocurrencies and tokens, and securely connect to decentralized - applications through a compatible web browser or the mobile app's built-in browser.

# Truffle :
- Truffle is a development environment, testing framework and asset pipeline for Ethereum, aiming to make life as an Ethereum developer easier.Truffle allows Built-in smart contract compilation, linking, deployment and binary management.
- Installation : `npm install -g truffle`
- Requirements : `NodeJS v8.9.4 or later`, `Windows, Linux or Mac OS X`	
- Creating a project : `truffle init`
- Compiling smart contracts : `truffle compile`
- Running Migrations : `truffle migrate`

# Ganache :
- Ganache is a personal blockchain for rapid Ethereum and Corda distributed application development. You can use Ganache across the entire development cycle; enabling you to develop, deploy, and test your dApps in a safe and deterministic environment. ... All versions of Ganache are available for Windows, Mac, and Linux.
- Ganache is used for setting up a personal Ethereum Blockchain for testing your Solidity contracts. It provides more features when compared to Remix.
- Ganache can be downloaded from the following URL − `https://truffleframework.com/ganache`

# Web3.js - Ethereum Javascript API :
- web3.js is a collection of libraries that allow you to interact with a local or remote ethereum node using HTTP, IPC or WebSocket. Basically it allows our frontend to get connected with the blockchain.
- Adding web3.js
- Web3.js can be added in the following ways :
- npm: npm install web3
- yarn: yarn add web3
- pure js: link the dist/web3.min.js 

# Account & Transaction types

- Account Types
- Externally owned account (EOAs): An account controlled by a private key, and if you own the private key associated with the EOA you have the ability to send ether and messages from it. These are accounts generated by users and using which users can initiate transactions.
Internal account (Contract): These are the accounts which are generated once a smart contract is deployed. Now all the transactions to this smart contract are handled using this internal account. Also such accounts do not have a private key.

- Transaction Types
- External transactions: Transactions initiated by users using their External account.
- Internal transactions: these are transactions initiated by smart contracts. These are just the function calls of a smart contract (this can also be some other smart contract).

- Note: all transactions have to be first initialised by External account. There may be some internal transactions made by an internal account in the later part of the chain but the initial transaction has to be done by an external account.

