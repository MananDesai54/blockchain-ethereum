//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

// Library is used to extract the common code of SC to reuse

// simple ex with pure function
library MyLibrary {
    function add10(uint256 a) public pure returns (uint256) {
        return a + 10;
    }
}

contract Library {
    function foo() external pure returns (uint256) {
        uint256 num = MyLibrary.add10(11);
        return num;
    }
}

// inside library we can manipulate the storage variable of the calling SC from Library and that is awesome. How this works is EVM call the DELEGATECALL opcode, what is does is it will allow SC to call another SC in its context
// ex with struct
library MyLibrary1 {
    struct Player {
        uint256 score;
    }

    function incrementScore(Player storage _player, uint256 value) public {
        _player.score += value;
    }
}

contract Library1 {
    mapping(uint256 => MyLibrary1.Player) players;

    function foo() external {
        MyLibrary1.incrementScore(players[0], 10);
    }
}

// using...for
contract Library2 {
    using MyLibrary1 for MyLibrary1.Player;
    mapping(uint256 => MyLibrary1.Player) players;

    function foo() external {
        players[0].incrementScore(10);
    }
}

// deployed vs embedded libraries
// deployed => If all the functions or data of library has visibility of public then when we deploy library and SC both will have its own address. SO for this kind of libs if SC A calls Library then it will manipulate variable of SC A and if SC B calls then manipulate variable of SC B
// embedded => If all the functions have type of internal then when we deploy SC and library both will reside in same eth address
