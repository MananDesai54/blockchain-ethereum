import { useEffect, useRef, useState } from "react";
import "./App.css";
import { address, abi } from "./lottery";
import { getWeb3 } from "./web3";

function App() {
  const [manager, setManager] = useState([]);
  const [players, setPlayers] = useState([]);
  const [balance, setBalance] = useState();
  const [enterAmount, setEnterAmount] = useState(0);
  const Web3 = useRef();
  const Lottery = useRef();

  useEffect(() => {
    (async function main() {
      const web3 = await getWeb3();
      const lottery = new web3.eth.Contract(abi, address);
      Web3.current = web3;
      Lottery.current = lottery;
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
      console.log(manager, players, balance);
    })().catch((error) => console.log(error.message));
  }, []);

  return (
    <div className="App">
      <h2>Lottery Contact</h2>
      <p>This contract is managed by {manager}</p>
      <p>
        There are currently {players.length} people entered, competing to win{" "}
        {balance && Web3.current.utils.fromWei(balance, "ether")} ether!!{" "}
      </p>
      <h2>Want to try your luck ?</h2>
      <form
        onSubmit={async (e) => {
          e.preventDefault();
          const accounts = await Web3.current.eth.requestAccounts();
          await Lottery.current.methods.enter().send({
            from: accounts[0],
            value: Web3.current.utils.toWei(enterAmount, "ether"),
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
          const accounts = await Web3.current.eth.requestAccounts();
          await Lottery.current.methods.winner().send({
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
