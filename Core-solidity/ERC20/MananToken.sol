//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;
import "./MyToken.sol";

contract MananToken {
    /**
     * ERC20 Token Common methods
     * transfer => transfer ERC20 token to Particular address
     * transferFrom and approve => trandfer token on-behalf of someone (Most exchanges wors like this)
                                => fist we have Owner address who have the own token 
                                => then we have operator addresss whom the Owner approve to spent some token 
                                => for approval we use approve function
     */
    address tokenAddress;
    function transfer() external {
        MyToken token = MyToken(tokenAddress);
        token.transfer(msg.sender, 100);
    }
    function transferFrom(address recient, uint value) external {
        MyToken token = MyToken(tokenAddress);
        token.transferFrom(msg.sender, recient, value);
    }
}

contract Owner {
    address tokenAddress;
    function transfer(address addr, uint value) external {
        MyToken token = MyToken(tokenAddress);
        token.approve(addr, value);
        
        MananToken manan = MananToken(tokenAddress);
        manan.transferFrom(addr, value);
    }
}