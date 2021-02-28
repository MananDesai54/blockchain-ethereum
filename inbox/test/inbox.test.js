const assert = require("assert");
const ganache = require("ganache-cli");
const Web3 = require("web3");
const {
  compiledData: {
    abi,
    evm: { bytecode },
  },
} = require("../compile");

const web3 = new Web3(ganache.provider());

let accounts;
let inbox;
const INIT_STRING = "Hi There !";

beforeEach(async () => {
  // get list of all accounts
  accounts = await web3.eth.getAccounts();

  // use one of those account to deploy contract
  inbox = await new web3.eth.Contract(abi)
    .deploy({
      data: bytecode.object,
      arguments: [INIT_STRING],
    })
    .send({ from: accounts[0], gas: "1000000" });
});

describe("Inbox Contract", () => {
  it("Deploys a contract", () => {
    assert.ok(inbox.options.address);
  });
  it("Message exists", async () => {
    const message = await inbox.methods.message().call();
    assert.strictEqual(message, INIT_STRING);
  });
  it("Message updated", async () => {
    await inbox.methods.setMessage("Bye There!").send({ from: accounts[0] });
    const newMessage = await inbox.methods.message().call();
    assert.strictEqual(newMessage, "Bye There!");
  });
});
