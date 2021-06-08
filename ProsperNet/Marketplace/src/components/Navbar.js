import React, { Component } from 'react';
import { NavLink } from "react-router-dom";

class Navbar extends Component {

  render() {
    return (
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <a className="navbar-brand" href="https://www.sakhaglobal.com/" target="_blank" rel="noopener noreferrer">ProsperNet Marketplace
        </a>
        <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarText">
          <ul className="navbar-nav mr-auto">
            <li className="nav-item">
              <NavLink exact activeClassName="active_class" className="nav-link" to="/">Home</NavLink>
            </li>
            <li className="nav-item">
              <NavLink exact activeClassName="active_class" className="nav-link" to="/createNft">CreateNft</NavLink>
            </li>
            <li className="nav-item">
              <NavLink exact activeClassName="active_class" className="nav-link" to="/myCollectibles">myCollectibles</NavLink>
            </li>
          </ul>
          <span className="navbar-text">
            {this.props.account}
          </span>
        </div>
      </nav>
    );
  }
}

export default Navbar;
