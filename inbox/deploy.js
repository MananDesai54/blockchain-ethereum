const HDWalletProvider = require("@truffle/hdwallet-provider");
const Web3 = require("web3");
const {
  compiledData: {
    abi,
    evm: { bytecode },
  },
} = require("./compile");
const { keys } = require("./key");

const provider = new HDWalletProvider(
  "sudden swarm rookie orient emerge turn fury network country patch extend black",
  keys.infuraLink
);

const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();
  console.log("Attempting to deploy", accounts[0]);

  const result = await new web3.eth.Contract(abi)
    .deploy({ data: bytecode.object, arguments: ["Hello There!"] })
    .send({ from: accounts[0], gas: "1000000" });

  console.log("Deployed the contract", result.options.address);
};
deploy().catch((error) => {
  console.log(error.message);
});
