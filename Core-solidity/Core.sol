//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

contract Core {

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

    // Constructor
    /**
     * Constructor is called whenever the smart contract deployed or deployment txn has been done
     * Constructor can have only two access modifiers: Public and Internal
     * Contract which have SC which is internal cannot be deployed, iit can be used to inherit from 
     * Contract with public constructor can be deployed
     */
    constructor() public {
        foo();
    }
    function foo() {
    }

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


    /**
     * Storage Array => can be of fixed and dynamic size (e.x uint[], uint[2]), will be stored in blockchain
     * Memory Array (temp array) => must be fixed size (e.x uint[2] nums), will not be stored in blockchain after funtion call ends
     * cannot use push for fixed size and memory array
     */

    // Storage Arrays with CRUD
    uint[] numbers;
    function arrayCRUD() {
        numbers.push(1);
        numbers[0];
        numbers[0] = 10;
        delete numbers[0]; //make the value at default valur of type(0 for int, false for tyep) will not change the length pf array
    }

    // Memory Array
    function memoArray() {
        uint[] memory nums = new uint[](10);
        // cannot use push for fixed size and memory array
        nums[0] = 1;
        nums[0];
        nums[0] = 10;
        delete nums[0];
    }

    // accept array as args and return array 
    // if fucntion is external then use calldata
    // if function is internal, public or private the use memory
    function arrayThing(uint[] calldata nums) external returns(uint[] memory){
        return nums;
    }
    function things(uint[] memory nums) internal/public/private returns(uint[] memory){
        return nums;
    }

    /**
     * Mapping => key-value pair
     * Declare
     * CRUD
     * Default values
     * nested mapping
     * array inside mapping
     */
    mapping(address => uint) accounts
    mapping(address => mapping(address => boolean)) approval;
    mapping(address => uint[]) scores;
    function mappingTasks() {
        accounts[msg.sender] = 10;
        accounts[msg.sender];
        accounts[msg.sender] = 15;
        delete accounts[msg.sender];

        // default value
        // if some mapping doesn't exists then it's value will be default
        // suppose accounts[0x0] doesn't exists and if we try to read it then it will be 0 as uint's default value

        approval[add1][add2] = true;
        approval[add1][add2];
        approval[add1][add2] = false;
        delete approval[add1][add2];

        scores[msg.sender].push(10);
        scores[msg.sender][0];
        scores[msg.sender][0] = 10;
        delete scores[msg.sender][0];
    }


    /**
     * Struct => Custom Types
     * CRUD
     * array of Struct
     * mapping of struct
     */
    struct User {
        string name;
        address accountId;
        uint score;
    }
    User[] users;
    mapping (address => User) usersData;
    function ex(string calldata _name) external {
        User memory manan = User(_name, msg.sender, 10);
        User memory manan2 = User({name: _name, accountId: msg.sender, score: 10});
        manan.accountId;
        manan.score = 1;
        delete manan;

        users.push(User({name: _name, accountId: msg.sender, score: 10}));

        mapping[msg.sender] = manan;
    }


    /**
     * Enum
     * Use
     * Use as arg
     */
    enum STATE {
        ACTIVE,
        INACTIVE
    }
    STATE state;
    function enumTasks(STATE _state) {
        state = STATE.ACTIVE;
        if(state == STATE.ACTIVE) {}
        // from web3js we cannot send enum as we don't know it so we can send int and solidity will convert it to enum
    }


    /**
     * storage, memory, calldata, stack memory locations

     * storage => will be stored in blockchain and persist after the function call so we can call it anytime, a state variable(variable outside function) is always storage variable and also if we want to make pointer to deeply netsted data into storage variable then also we need to use storage variable
     e.x => 
     struct User {
        string name;
     }
     User[] users;
     function ex() {
        User storage user1 = users[0]; // this is ref/pointer to user[0], it's pass by ref not pass by value so not copy the data in it (deep copy)
        user1.name = "aa;
        //or
        users[0].name = "aa";
     }

     * memory => will not be stored in blockchain, only be in memory while function execution.

     memory's lifetime is limited to a function call and is meant to be used to temporarily store variables and their values. Values stored in memory do not persist on the network after the transaction has been completed. Some notable implementation details about memory are as follows:

     It can be used for both function declaration parameters as well as within the function logic
     It is mutable (it can be overwritten and changed)
     It is non-persistent (the value does not persist after the transaction has completed)
     memory cannot be used at the contract level. Only in methods.
     
     e.x =>
     function foo() external {
        User memory user1 = users[0]; // this is pass by value so copyt the value(shallow copy)
        user1.name = "aa"; // not affect the actual value of users array, change copied value
        bar(user1);
     }
     function bar(User memory usr) internal {}

     * calldata => only available with funtion that are external or public. When we wan to pass complex datatype to external function as the external call will be txn so we can't specify the memory type so we need to give calldata location for it. calldata is a non-modifiable, non-persistent area where function arguments are stored, and behaves mostly like memory.

     calldata is very similar to memory in that it is a data location where items are stored. It is a special data location that contains the function arguments, only available for external function call parameters. From the Solidity docs:

     Calldata is a non-modifiable, non-persistent area where function arguments are stored, and behaves mostly like memory.

     This is the cheapest location to use, but it has a limited size. In particular, that means that functions may be limited in their number of arguments.1 Notable implementation details about calldata are as follows:

     It can only be used for function declaration parameters (and not function logic)
     It is immutable (it can't be overwritten and changed)
     It must be used for dynamic parameters of an external function
     It is non-persistent (the value does not persist after the transaction has completed)

     * stack => all the simple variable inside function are stack variable(we need to spoecify memory and storage if we want to change). It is almost free to use, but can only hold a limited amount of values.
     */


    /**
     * Events => We can push data from smart contracts to our apps, e.x=> we can emit events everytime there is trade and we can watch to event from our app. We can index events args to filter events more efficiently. As indexing is a costly operation we can have upto 3 index variables in a singl event
     - events cannot be read from samrt contracts
     - we can just emit evant and it can be consumed by entity outside blockchain
     - we can use events as storage for some use cases as they cost low gas
     - for txn we cannot return data from smart contract so we can use events for them and emit event on success of txn
     */
    event Trade(
        address indexed from,
        address indexed to,
        uint timestamp
    );
    funtion onTrade() external {
        emit Trade(msg.sender, now());
    }


    /**
     * send ether and get balance of smart contract
     * need payable funtion= => payable allow us to send ether with funtion call
     * function must not be view
     */
    mapping(address => uint) funds;
    function sendEth() external payable { 
        // this function will send ether to smart contract
        if (msg.value > 1 ether || msg.value < 1000 wei) {
            revert();
        }
        funds[msg.sender] += msg.value;
    }
    //get balance of smart contract
    function balanceOf() external view returns(uint) {
        return address(this).balance; //`this` refer to current contract
    }


    /**
     * send ether to any address or to other smart contract
      * tranfer ether from smart contract to any address
      */
        function sendToAdd(address payable to) external {
            to.transfer(1 ether);
        }

     /**
       * transfer ether from one account to other
      */
        function sendTo(address payable to) external payable {
            to.transfer(msg.value);
        } 
    /**
      => If we want to send ether with txn then only we need to make our method payable, if we are sending ether from balance of smart contract then don't need to make method payable
      => inshort if we are getting value of ether from msg.value then we need method as payable

      * address vs address payable
      => address is type that can store ethereum address
      => now if we want to send ether to the address then we need to make type as `address payable`. Smart contract can send ether to specific address only if the address is `address payable` type 

      * address payable casting (address and uint160)
      => we can cast address payable to address but address to address payable is not possible
      e.x => 
      */
             address payble add = 0x0;
             address add1 = add; //possible
             address payable add1; // not possible
      /**
      => so to convert address to address payable we need to do this
             address payable add1 = payable(add); // possible
      => msg.sender is address of txn sender but it's types is not address, it's address payble so we can send ether directly to msg.sender by `msg.sender.transfer(1 ether)`

      * send vs transfer
      => in transfer method if error occurs then it will propogated to smart contract and whole txn will fail and 
      => with send it will return boolean so we can do something with it instead of throwing error
      e.x
      */
        function sendToAdd(address payable to) external returns(bool){
            bool isSuccess = to.send(1 ether);
            return isSuccess;
        }
}
