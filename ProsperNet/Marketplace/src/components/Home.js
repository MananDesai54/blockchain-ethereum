import React, { Component } from 'react';

class Home extends Component {

  constructor(props) {
    super(props)
    this.state = {
    }
  }

  render() {
    return (
      <div id="content">

        <h4>Nft For Sale</h4>

        {/* displaying all nftCollection */}
        <div className="container-fluid row">
          {this.props.nftCollection.map((nft, key) => {
            return (
              <div key={key} className="col col-sm-4 col-md-3 mt-5">
                <div className="card" >
                  <img height="300px" src={"https://ipfs.io/ipfs/" + nft.id.toString()} className="card-img-top " alt="failed to load" />
                  <div className="card-body">
                    <h5 className="card-title">{window.web3.utils.fromWei(nft.price.toString(), "Ether")} Eth</h5>
                    <p className="card-text">Owner: {nft.owner}</p>
                    <p className="card-text">Artist: {nft.artist}</p>

                    <div>
                      <a className="btn btn-lg btn-primary" href={"https://ipfs.io/ipfs/" + nft.id.toString()} target="_blank" rel="noopener noreferrer">
                        Open
                      </a>


                      {nft.status === 0
                        ? <button className="btn btn-lg btn-primary" style={{ float: "right" }}
                          name={nft.id}
                          value={nft.price}
                          onClick={(event) => {
                            this.props.purchaseNft(event.target.name, event.target.value)
                          }}
                        >
                          Buy
                        </button>

                        : <button className="btn btn-lg btn-primary" style={{ float: "right" }}
                          disabled
                        >
                          Not for sale
                        </button>
                      }
                    </div>
                  </div>
                </div>
              </div>
            )
          })}
        </div>

      </div>
    );
  }
}

export default Home;
