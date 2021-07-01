const App = {
  contracts: {},
  load: async () => {
    await App.loadWeb3();
    await App.loadAccounts();
    await App.loadContract();
  },
  loadWeb3: async () => {
    if (window.ethereum) {
      window.web3 = new Web3(window.ethereum);
      await window.ethereum.enable();
    } else if (window.web3) {
      window.web3 = new Web3(window.web3.currentProvider);
    } else {
      window.alert(
        "Non-Ethereum browser detected. You should consider trying MetaMask!"
      );
    }
  },
  loadAccounts: async () => {
    App.account = web3.eth.accounts[0];
    console.log(App.account);
  },
  loadContract: async () => {
    const contract = await $.getJSON("TodoList.json");
    App.contracts.TodoList = TruffleContract(contract);
    App.contracts.TodoList.setProvider(window.web3.currentProvider);

    App.contracts.todoList = await App.contracts.TodoList.deployed();
    const address = await App.contracts.todoList.address;
    console.log(address);
  },
};

$(() => {
  $(window).load(() => {
    App.load();
  });
});
