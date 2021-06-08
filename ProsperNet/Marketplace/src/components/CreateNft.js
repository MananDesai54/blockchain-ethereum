import React, { Component } from 'react';
import axios from 'axios';

class CreateNft extends Component {

  constructor(props) {
    super(props)
    this.state = {
      file: null,
      nftPrice: 0,
    }
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(event) {
    this.setState({
      file: event.target.files[0]
    })
  }

  //adding nft to ipfs & adding it to blockchain
  addNft = (nftPrice) => {
    const data = new FormData();
    data.append('file', this.state.file);
    axios({ method: "POST", url: "http://localhost:8000/upload", data }).then(response => {

      if (response.data.error) {
        console.log("status: ", response.data.status);
        console.log(response.data.error);
      }
      else {
        //adding nft to blockchain
        this.props.createNft(response.data.fileHash, nftPrice, this.nftType);
      }
    });
  }

  render() {
    return (

      // Creating NFT
      <div id="content">
        <div className="container-fluid col-md-6" style={{ "textAlign": "left" }}>
          <h1>Add Nft</h1>
          <form encType="multipart/form-data"
            method="POST"
            onSubmit={(event) => {
              event.preventDefault()
              this.addNft(parseFloat(this.nftPrice.value));
            }}
          >
            <div className="form-group mr-sm-2">
              <input
                id="nftPrice"
                type="text"
                ref={(input) => { this.nftPrice = input }}
                className="form-control"
                placeholder="Nft Price"
                required />
            </div>
            <div className="form-group mr-sm-2">
              <input
                type="file"
                name="file"
                className="form-control"
                onChange={this.handleChange}
                required />
            </div>

            <button type="submit" className="btn btn-primary">Add Nft</button>
          </form>
        </div>
      </div>
    );
  }
}

export default CreateNft;
