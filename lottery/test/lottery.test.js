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
let lottery;

beforeEach(async () => {
  // get list of all accounts
  accounts = await web3.eth.getAccounts();

  // use one of those account to deploy contract
  lottery = await new web3.eth.Contract(abi)
    .deploy({
      data: bytecode.object,
    })
    .send({ from: accounts[0], gas: "1000000" });
});

describe("Lottery Contract", () => {
  it("Deployed Successfully", async () => {
    assert.ok(lottery.options.address);
  });

  it("Enter 1 player to lottery", async () => {
    await lottery.methods
      .enter()
      .send({ from: accounts[1], value: web3.utils.toWei("0.002", "ether") });

    let players = await lottery.methods.getPlayers().call({
      from: accounts[0],
    });

    assert.strictEqual(accounts[1], players[0]);
    assert.strictEqual(1, players.length);
  });

  it("Enter multiple players to lottery", async () => {
    await lottery.methods
      .enter()
      .send({ from: accounts[1], value: web3.utils.toWei("0.002", "ether") });
    await lottery.methods
      .enter()
      .send({ from: accounts[2], value: web3.utils.toWei("0.002", "ether") });
    await lottery.methods
      .enter()
      .send({ from: accounts[3], value: web3.utils.toWei("0.002", "ether") });

    let players = await lottery.methods.getPlayers().call({
      from: accounts[0],
    });

    assert.strictEqual(accounts[1], players[0]);
    assert.strictEqual(accounts[2], players[1]);
    assert.strictEqual(accounts[3], players[2]);
    assert.strictEqual(3, players.length);
  });

  it("send minimum 0.001 ether", async () => {
    try {
      await lottery.methods.enter().send({
        from: accounts[1],
        value: web3.utils.toWei("0.0002", "ether"),
      });
      assert(false);
    } catch (error) {
      assert(error.message);
    }
  });

  it("only manager can choose winner", async () => {
    try {
      await lottery.methods.winner().send({
        from: accounts[1],
      });
      assert(false);
    } catch (error) {
      assert(error.message);
    }
  });

  it("send Winner and reset players", async () => {
    await lottery.methods
      .enter()
      .send({ from: accounts[1], value: web3.utils.toWei("2", "ether") });

    const initialBalance = await web3.eth.getBalance(accounts[1]);
    await lottery.methods.winner().send({ from: accounts[0] });
    const finalBalance = await web3.eth.getBalance(accounts[1]);
    const difference = finalBalance - initialBalance;
    assert(difference > web3.utils.toWei("1.8", "ether"));
  });

  it("Get Manager", async () => {
    const manager = await lottery.methods.manager().call();
    console.log(manager);
  });

  it("Get All Players", async () => {
    const players = await lottery.methods.getPlayers().call();
    console.log(players);
  });
});
