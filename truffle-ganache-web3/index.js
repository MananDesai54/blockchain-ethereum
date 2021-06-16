const Web3 = require("web3");

/* Connect to ethereum node */
const etherUrl = "http://localhost:7545";
const abi = [
  {
    constant: true,
    inputs: [
      {
        name: "",
        type: "uint256",
      },
    ],
    name: "tasks",
    outputs: [
      {
        name: "id",
        type: "uint256",
      },
      {
        name: "content",
        type: "string",
      },
      {
        name: "completed",
        type: "bool",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
    signature: "0x8d977672",
  },
  {
    constant: true,
    inputs: [],
    name: "taskCount",
    outputs: [
      {
        name: "",
        type: "uint256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
    signature: "0xb6cb58a5",
  },
  {
    inputs: [],
    payable: false,
    stateMutability: "nonpayable",
    type: "constructor",
    signature: "constructor",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        name: "id",
        type: "uint256",
      },
      {
        indexed: false,
        name: "content",
        type: "string",
      },
      {
        indexed: false,
        name: "completed",
        type: "bool",
      },
    ],
    name: "TaskCreated",
    type: "event",
    signature:
      "0x05d0fb833127fc08168556d0e7ca9554fc3f6bc843b3b7d2bf1c35aea6bab660",
  },
  {
    constant: false,
    inputs: [
      {
        name: "_content",
        type: "string",
      },
    ],
    name: "createTask",
    outputs: [],
    payable: false,
    stateMutability: "nonpayable",
    type: "function",
    signature: "0x111002aa",
  },
];

let web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider(etherUrl));

/*Call the function which already deployed on ethereum network
  Notice: ABI have to modified when the smart contract code change*/
var contractInstance = new web3.eth.Contract(
  abi,
  "0xFBA7934D8e8B571881eAc6E0810b17f946C81804"
);

async function main() {
  const tasks = await contractInstance.methods.taskCount().call();
  console.log(tasks);
}

main();
