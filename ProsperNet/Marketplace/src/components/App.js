import React, { Component } from 'react';
import Web3 from 'web3'
import './App.css';
import Marketplace from '../abis/ProsperNetNft.json'
import {
  Route,
  Switch,
} from "react-router-dom";
import Navbar from './Navbar'
import Home from './Home'
import CreateNft from './CreateNft';
import MyCollectibles from './MyCollectibles';

class App extends Component {

  constructor(props) {
    super(props)
    this.state = {
      account: '',
      nftCount: 0,
      nftCollection: [],
      loading: true,
      errMsg: "",
    }

    //configuration
    this.TIMEOUT_VALUE = 1000; //milliseconds

    this.createNft = this.createNft.bind(this)
    this.purchaseNft = this.purchaseNft.bind(this)
    this.changeNftStatus = this.changeNftStatus.bind(this)
  }

  async componentWillMount() {
    await this.loadWeb3()
    await this.loadBlockchainData()
  }

  async loadWeb3() {
    if (window.ethereum) {
      window.web3 = new Web3(window.ethereum)
      await window.ethereum.enable()
    }
    else if (window.web3) {
      window.web3 = new Web3(window.web3.currentProvider)
    }
    else {
      window.alert('Non-Ethereum browser detected. You should consider trying MetaMask!')
    }
  }

  loadBlockchainData = async () => {
    const web3 = window.web3
    // Load account
    const accounts = await web3.eth.getAccounts()
    this.setState({ account: accounts[0] })
    const networkId = await web3.eth.net.getId()
    const networkData = Marketplace.networks[networkId]
    if (networkData) {
      const marketplace = web3.eth.Contract(Marketplace.abi, networkData.address)
      this.setState({ marketplace })
      const nftCount = await marketplace.methods.nftCount().call()
      this.setState({ nftCount })

      // Load nftCollection
      let tempNftCollection = [];
      for (var i = 0; i < nftCount; i++) {
        const nft = await marketplace.methods.nftCollection(i).call()
        tempNftCollection.push(nft);
      }
      this.setState({
        nftCollection: tempNftCollection,
        loading: false
      })
    }
    else {
      window.alert('Marketplace contract not deployed to detected network.')
    }
  }

  createNft = (nftId, price) => {
    this.setState({ loading: true })

    this.state.marketplace.methods.nftDoExist(nftId.toString()).call().then((result) => {
      if (result === false) {
        this.state.marketplace.methods.createNft(nftId.toString(), window.web3.utils.toWei(price.toString(), 'Ether')).send({ from: this.state.account })
          .once('transactionHash', (hash) => {
            setTimeout(() => {
              this.loadBlockchainData();
            }, this.TIMEOUT_VALUE);
          })
          .once('receipt', (receipt) => {
            console.log("receipt started");
          }).once('error', (error) => {
            console.log(error);
          })
        this.setState({ loading: false })
      }
      else {
        this.setState({
          errMsg: "NFT already Exist!!!",
          loading: false
        })
      }

    }).catch((error) => {
      console.log("error from nftDoExist", error);
      this.setState({ loading: false });
    })
  }

  changeNftStatus = (nftId, statusVal) => {
    if (statusVal === 0) {
      this.state.marketplace.methods.openToSale(nftId.toString()).send({ from: this.state.account })
        .once('transactionHash', (hash) => {
          setTimeout(() => {
            this.loadBlockchainData();
          }, this.TIMEOUT_VALUE);
        })
        .once('receipt', (receipt) => {
          console.log("receipt started");
        }).once('error', (error) => {
          console.log(error);
        })
    }
    else if (statusVal === 1) {
      this.state.marketplace.methods.notForSale(nftId.toString()).send({ from: this.state.account })
        .once('transactionHash', (hash) => {
          setTimeout(() => {
            this.loadBlockchainData();
          }, this.TIMEOUT_VALUE);
        })
        .once('receipt', (receipt) => {
          console.log("receipt started");
        }).once('error', (error) => {
          console.log(error);
        })
    }
  }


  //=============Transaction==========
  purchaseNft(nftId, price) {
    this.setState({ loading: true })
    this.state.marketplace.methods.purchaseNft(nftId.toString()).send({ from: this.state.account, value: price })
      .once('transactionHash', (hash) => {
        this.setState({
          loading: false,
        })
      })
      .once('receipt', (receipt) => {
        this.setState({ loading: false })
      }).once("error", (error) => {
        this.setState({
          errMsg: "Transaction Failed",
          loading: false
        })
      })
  }

  render() {
    return (
      <div>
        <Navbar account={this.state.account} />
        <div><h3>
          {this.state.errMsg}
        </h3>
        </div>

        <main role="main">
          {this.state.loading
            ?
            <div id="loader" className="spinner-border text-primary" role="status">
              <span className="sr-only">Loading...</span>
            </div>
            :
            <div>
              <Switch>
                <Route exact path="/"
                  component={() => <Home
                    nftCollection={this.state.nftCollection}
                    purchaseNft={this.purchaseNft}
                  />}
                />
                <Route exact path="/createNft"
                  component={() => <CreateNft
                    createNft={this.createNft}
                  />}
                />
                <Route exact path="/myCollectibles"
                  component={() => <MyCollectibles
                    nftCollection={this.state.nftCollection}
                    account={this.state.account}
                    changeNftStatus={this.changeNftStatus}
                  />}
                />
              </Switch>
            </div>
          }
        </main>
      </div>
    );
  }
}

export default App;
