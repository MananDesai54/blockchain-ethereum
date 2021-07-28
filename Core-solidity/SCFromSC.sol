//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

// create child contract
// => create child smart contract
// => then create instance of the child by this `Loan loan = new Loan(...args_required _in_constructor);`
// => by using `new` keyword the smart contract that executes this code will deploy new smart contract from it
// => for storing address of deployed smart contract we cannot return it because deploying smart contract need a txn and returning value need function to `view` and txn is not compatible with view function so we cannot return it so we need to store ref to new created smart contract in smart contract

// store child contract address
// => We can store array of refs or array of addresses in smart contract

// cast contract pointer to child
// => address(loan) this will cast contract pointer to address

// call functions of child
// => same as regular

// Caveat when admin is contract
// suppose Loan contract is implementing admin only feature in SC and setting admin = msg.sender in constructor then the SC which deploy the Loan contract will become admin so the contract will be locked as it has admin which is SC so we cannot call method directly without using SC

contract LoanFactory {
    Loan[] loans;
    address[] loanAddresses;

    function createLoan() external {
        Loan loan = new Loan(10);
        loans.push(loan);
        loanAddresses.push(address(loan));

        loan.getAmount();
    }
}

contract Loan {
    uint256 public amount;
    address admin;

    constructor(uint256 _amount) public {
        amount = _amount;
        admin = msg.sender; // Will make SC as admin so not recommended
    }

    function getAmount() external view returns (uint256) {
        return amount;
    }
}
