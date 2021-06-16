//  SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    constructor() public {
        createTask("Learn Ethereum");
    }

    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    mapping(uint256 => Task) public tasks;

    event TaskCreated(uint256 id, string content, bool completed);

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }
}
