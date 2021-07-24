//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

contract Core {

    /**
     * Function Modifier Keywords
     * view => This will only view the or read the data from smart contract statte/storage variables (So it's readonly)
     * pure => This will not use any state/storage variable but it will do computation and may or maynot return results (like calculating or validating hash)
     */

    /**
     * Fuction Visibility Keywords
     * external => Function will not be able to called from inside any contracts only be called out side smart contract
     * internal => function will be only called by contract it self and the contract which inherihts the current contract (child contract), not availble outside
     * public => available everywhere
     ** private => available only inside smart contract
     */

    /**
     * Variable Visibility Keywords
     * internal => only availbale in contract and it'schild
     * public => avilable every where and availble as a etter function outside smart contract
     * private => available in current smart contract only, it is not accessible outside smart contract but it is stored on eth blockchain and eth is public thing and nothing is private in it so some tools like analytics tool can see it so don't put private info in it.
     */

    /**
     * Built-in Variables
     * tx => has details of current txn 
      * tx.gas => amount of gas required for the txn
      * tx.origin => ethereum address (account address) that sent the txn
      * tx.gasprice => gas price of current txn
     * msg => messages/ gives the info about calling env of the msg(txn) / The msg global variables in particular are special global variables that contain properties which allow access to the blockchain
      * msg.gas => the available gas remaining for a current transaction, it's depricated and replced by gasLeft()
      * msg.data => complete calldata which is a non-modifiable, non-persistent area where function arguments are stored and behave mostly like memory
      * msg.sender => the address where the current (external) function call came from
      * msg.sig => The first four bytes of the calldata for a function that specifies the function to be called (i.e., it’s function identifier)
      * msg.value => the amount of ether sent with current txn in wei (1wei = 10^-18 eth)
     * block => details about current block at the time it mined
      * block.coinbase => current block miner’s address
      * block.difficulty => current block difficulty (nonce)
      * block.gaslimit => current block gaslimit
      * block.number => current block number
      * block.timestamp => current block timestamp (timestamp at which block mined)
      * blockhash(blockNumber);
     * now(uint) => current blocktime stamp (alias for block.timestamp)
     * gasleft() returns (uint256) => remaining gas
     */

    /**
     * msg.sender vs tx.origin
     * Alice sends txn to Smart Contract A
        tx.origin => Alice's address
        msg.sender => Alices's address
     * Now Smart Contract A sends txn to Smart Contract B
        tx.origin => Alice's address as Alice signed the txn
        msg.sender => Contract A's address as A sends message to B

     * msg vs txn
        * txn is one block for all the things heppens in above example so it's one 1 external txn 
        * msg are the internal txns heppens inside Smart Contracts
        * for first call txn and msg is same, while for other call from smart contract txn remain contant whic=le msg changes
     */

    /**
     * What is Block?
     * A collection of txns
     */



    // 1. Fixed Size Types
    bool isReady;
    uint256 num;
    address sender;
    bytes32 data;

    // 2. Variable size Types
    string name;
    bytes _data;
    uint256[] numbers;
    mapping(address => uint256) accounts;

    // 3. User Defined Type
    struct MyType {
        string name;
        uint256 value;
    }
    enum Status {
        PAID,
        UNPAID
    }

    // functions
    function sample(uint256 arg) external view returns (uint256) {
        return arg + num;
    }
}
