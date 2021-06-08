# Installation of required tools & technologies


# IPFS (Command-line) installation


* for linux 
    
```bash
$ wget https://dist.ipfs.io/go-ipfs/v0.8.0/go-ipfs_v0.8.0_linux-amd64.tar.gz
$ tar -xvzf go-ipfs_v0.8.0_linux-amd64.tar.gz

$ cd go-ipfs
$ sudo bash install.sh
# Test that IPFS has installed correctly:
$ ipfs --version

# Start the daemon
$ ipfs daemon
# Message "Daemon is ready" should appear
```
Install IPFS command-line from [official documentation](https://docs.ipfs.io/install/command-line/) for your operating system.


Daemon should be active all the time while your project is running.

# [Download](https://www.trufflesuite.com/ganache) & Configure Ganache

* Run Ganache
* Click on New Workspace
* Provide any Workspace name
* Click on Add Project and browse truffle-config.js file from "cloned project->Marketplace->truffle-config.js"
* Save workspace
* Keep Ganache active all the time while your project is running.

# Metamask

## Configure Network 
* add metamask extension for your browser
* Go to Settings->Network->Add Network
```bash
Network Name: #any
New RPC url: http://127.0.0.1:7545/
Chain id: 1337 (suggested by metamask when you enter some random value)
Currency symbol: ETH
```

## Get all the accounts from Ganache
```bash
Click on profile on top right
Select Lock->import using seed phrase
Get the MNEMONIC PHRASE from Ganache under Accounts tab
```


# Install node_modules & Migrate smart contract

* Inside Ipfs-manager folder 
```bash
# to install all the requried node_modules.
$ npm i
```
* Inside Marketplace folder
```bash
# to install all the requried node_modules.
$ npm i

# to migrate the smart contract.
$ truffle migrate
```

# Run project
* Inside Ipfs-manager folder 
```bash
$ node app.js
```
* Inside Marketplace folder
```bash
# to install all the requried node_modules.
$ npm start
```
