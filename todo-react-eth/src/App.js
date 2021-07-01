import { useEffect } from "react";
import "./App.css";
import Web3 from "web3";

function App() {
  useEffect(() => {
    const loadBlockchainData = async () => {
      const web3 = new Web3(Web3.givenProvider || "http://localhost:8545");
      const network = await web3.eth.net.getNetworkType();
      const accounts = await web3.eth.getAccounts();
      console.log(network, accounts);
    };
    loadBlockchainData().catch(console.log);
  });
  return <div className="App">Hello</div>;
}

export default App;
