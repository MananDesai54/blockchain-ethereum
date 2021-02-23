pragma solidity ^0.6.0;

// Ether - pay smart contract
// modifiers
// visibility
// Events
// Enums
contract HotelRoom {
    enum Status { Vacant, Occupied }
    Status currentStatus;
    address payable public owner;
    
    event occupy(address _occupant, uint value);
    
    constructor() public {
        owner = msg.sender;
        currentStatus = Status.Vacant;
    }
    
    modifier onlyWhileVacant {
        //check status
        require(currentStatus == Status.Vacant, "Currently occupied.");
        _;
    }
    modifier onlyWhileEtherValid(uint amount) {
        //check price
        require(msg.value >= amount, "Not enough ether provided.");
        _;
    }
    
    receive() external payable onlyWhileVacant onlyWhileEtherValid(2 ether) {
        currentStatus = Status.Occupied;
        owner.transfer(msg.value);
        emit occupy(msg.sender, msg.value);
    }
}