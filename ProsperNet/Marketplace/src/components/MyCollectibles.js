import React, { Component } from 'react';

class MyCollectibles extends Component {

  constructor(props) {
    super(props)
    this.state = {
    }

    this.myNftCollection = [];
    for (let i = 0; i < this.props.nftCollection.length; i++) {
      if (this.props.nftCollection[i].owner === this.props.account)
        this.myNftCollection.push(this.props.nftCollection[i]);
    }
  }

  render() {
    return (
      <div>

        <h4>My Collectibles</h4>

        {/* displaying all current users nftCollection */}
        <div className="container-fluid row">
          {this.myNftCollection.map((nft, key) => {
            return (
              <div key={key} className="col col-sm-4 col-md-3 mt-5">
                <div className="card" >
                  <img height="300px" src={"https://ipfs.io/ipfs/" + nft.id.toString()} className="card-img-top" alt="failed to load" />
                  <div className="card-body">
                    <h5 className="card-title">{window.web3.utils.fromWei(nft.price.toString(), "Ether")} Eth</h5>
                    <div className="card-text mb-5"> 
                      {nft.status === 1
                        ? <div>Status: Not For Sale</div>
                        : <div>Status: Open For Sale</div>
                      }
                    </div>
                    <p className="card-text">Artist: {nft.artist}</p>
                    
                    <div>
                      <a className="btn btn-lg btn-primary" href={"https://ipfs.io/ipfs/" + nft.id.toString()} target="_blank" rel="noopener noreferrer">
                        Open
                      </a>

                    
                    <button className= "btn btn-lg btn-primary" style={{float: "right"}}
                      name={nft.id}
                      value={nft.status}
                      onClick={ (event) => {
                        this.props.changeNftStatus(event.target.name, 1-parseInt(event.target.value) );
                      }}
                    >Toggle Status</button>
            
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

export default MyCollectibles;
