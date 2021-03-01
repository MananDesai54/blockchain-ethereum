// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract Lottery {
    address public manager;
    address payable[] public players;
    
    modifier hasSentEther {
        require(msg.value >= .001 ether, "You need to send at least 0.001 ether to enter the lottery");
        _;
    }
    
    modifier canNotJoinTwice {
        bool isExist = false;
        for(uint i = 0; i< players.length; i++) {
            if(players[i] == msg.sender) {
                isExist = true;
                break;
            }
        }
        require(isExist == false, "You cannot join twice");
        _;
    }
    
    modifier ownerCanNotJoin {
        require(msg.sender != manager, "Owner cannot join it's own lottery");
        _;
    }
    
    modifier isOwner {
        require(msg.sender == manager, "You are not a creator of the lottery");
        _;
    }
    
    constructor() {
        manager = msg.sender;
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }
    
    function enter() public payable hasSentEther ownerCanNotJoin canNotJoinTwice {
        players.push(msg.sender);
    }
    
    function winner() public isOwner returns (address payable) {
        uint winnerIndex = random() % players.length;
        players[winnerIndex].transfer(address(this).balance);
        address payable _winner = players[winnerIndex];
        players = new address payable[](0);
        return _winner;
    }
    function getPlayers() public view isOwner returns (address payable[] memory) {
        return players;
    }
}