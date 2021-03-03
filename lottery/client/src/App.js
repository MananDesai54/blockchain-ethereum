import { useEffect, useState } from "react";
import "./App.css";
import { lottery } from "./lottery";
import { web3 } from "./web3";

function App() {
  const [manager, setManager] = useState([]);
  const [players, setPlayers] = useState([]);
  const [balance, setBalance] = useState();
  const [enterAmount, setEnterAmount] = useState(0);

  useEffect(() => {
    (async function main() {
      const accounts = await web3.eth.requestAccounts();
      const manager = await lottery.methods
        .getManager()
        .call({ from: accounts[0] });
      const players = await lottery.methods
        .getPlayers()
        .call({ from: accounts[0] });
      const balance = await web3.eth.getBalance(lottery.options.address);
      setManager(manager);
      setPlayers(players);
      setBalance(balance);
    })().catch((error) => console.log(error.message));
  }, []);

  return (
    <div className="App">
      <h2>Lottery Contact</h2>
      <p>This contract is managed by {manager}</p>
      <p>
        There are currently {players.length} people entered, competing to win{" "}
        {balance && web3.utils.fromWei(balance, "ether")} ether!!{" "}
      </p>
      <h2>Want to try your luck ?</h2>
      <form
        onSubmit={async (e) => {
          e.preventDefault();
          const accounts = await web3.eth.requestAccounts();
          await lottery.methods.enter().send({
            from: accounts[0],
            value: web3.utils.toWei(enterAmount, "ether"),
          });
        }}
      >
        <label htmlFor="amount">Amount of Ether to enter</label>
        {"  "}
        <input
          type="text"
          name="amount"
          id="amount"
          value={enterAmount}
          onChange={(e) => setEnterAmount(e.target.value)}
        />
        <div>
          <button type="submit">Enter</button>
        </div>
      </form>
      <button
        type="button"
        onClick={async (e) => {
          e.preventDefault();
          const accounts = await web3.eth.requestAccounts();
          await lottery.methods.winner().send({
            from: accounts[0],
          });
        }}
      >
        Pick Winner
      </button>
    </div>
  );
}

export default App;
