//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

// UseCase => receive ether, fallback(call this function if the called function doesn't exists)
contract Fallback {
    // Declare fallback function
    // use fallback/receive(for eth txn) keyword and only visibility external is allowed
    fallback() external {}

    // difference with regular function
    // no name, no args, define only one in one SC, define using keywords fallback/receive(for eth txn)

    // send some data
    // We cannot send data via params but we can send via msg.data, which is of type byte so we need to use assembly to pass the data to solidity types like uint bool etc
    fallback() external {
        bytes = msg.data;
    }

    // send some ether
    receive() external payable {}

    // gas stipend
    // If we call fallback fun from another SC then gas limit is 2300, this is only for fallback fun
    // call fallback function from another SC
    recipient.send(amount)
    recipient.transfer(amount)

    contract A {
        address payable addressB;
        function one() public payable {
            addressB.transfer(msg.value);
        }
    }
    contract B {
        receive() external payable {
            address payable addr;
            addr.transfer(msg.value);
        }
    }
    addressB.call.value(msg.value)()
    addressB.call.value(msg.value).gas(maxGas)()


    // reject incoming calls
    // reject every call or reject some call or reject ether txn
    // to reject ether txn use fallback instead of receive
    fallback() external {
        revert();
        if(msg.data.length > 0) {
            revert();
        }
    }
}
// ex: Call function that doesn't exists
contract A {
    fallback() external {}
}
contract B {
    function foo() external {
        A a = new A();
        // this will call fallback functions
        CA(address(a)).doesNotExist();
    }
}
interface CA {
    function doesNotExist() external;
}

// ex: send ether to regular address
// ex: send ether from SC
contract A {
    receive() external payable {}
}
contract B {
    function foo() external {
        A a = new A();
        CA(address(a)).doesNotExist();
        address payable addr = payable(address(a));
        addr.transfer(1 ether);
    }
}
interface CA {
    function doesNotExist() external;
}

