import { useEffect, useState } from "react";
import "./App.css";
import { lottery } from "./lottery";
import { web3 } from "./web3";

function App() {
  const [manager, setManager] = useState([]);

  useEffect(() => {
    (async function main() {
      const accounts = await web3.eth.requestAccounts();
      const manager = await lottery.methods
        .manager()
        .call({ from: accounts[0] });
      const players = await lottery.methods
        .getPlayers()
        .call({ from: accounts[0] });
      const balance = await web3.eth.getBalance(lottery.options.address);

      console.log(manager);
      console.log(players);
      console.log(balance);
    })().catch((error) => console.log(error.message));
  }, []);

  return (
    <div className="App">
      <h2>Lottery Contact</h2>
      <p>This contract is managed by {manager}</p>
    </div>
  );
}

export default App;
