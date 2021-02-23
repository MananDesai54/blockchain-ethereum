pragma solidity ^0.6.0;


// Inheritance
// Factories: contact will create another contracts
// Smart contracts interaction

contract Ownable {
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }
}

contract SecretVault {
     string secret;
    
    
    constructor(string memory _secret) public {
        secret = _secret;
    }
    
    function getSecret() public view returns(string memory) {
        return secret;
    }
}

contract MyContact is Ownable {
    address secretVault;
    
    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }
    function getSecret() public view onlyOwner returns(string memory) {
        SecretVault _vault = SecretVault(secretVault);
        return _vault.getSecret();
    }
}