// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ToDo {
  enum Progress { inActive, onGoing, finish, cancel }
  struct Thing {
    string title;
    string content;
    Progress progress; 
  }
  Thing[] public toDoList;
  address owner;
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }  

  constructor() {
    owner = msg.sender;
  }

  function createThings(Thing memory thing) public restricted {
    toDoList.push(thing);
  }

  function changeProgess(uint index, Progress newProgress) public restricted {
    toDoList[index].progress = newProgress;
  }

}