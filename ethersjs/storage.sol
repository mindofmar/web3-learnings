// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// Store a single data point and allow fetching/updating of that datapoint
contract SimpleStorage {
    // data point
    string public storedData;

    // uint = pos and negative
    // int = positive only
    uint256 highscore;
    address creator;
    // mapping = keyvalue pair. like Map() in javascript
    mapping(address => uint256) public balances;

    event myEventTest(string eventOutput);

    // this uses gas
    function set(string memory myText) public {
        storedData = myText;
        emit myEventTest(myText);
    }

    // view keyword means it does not use gas
    // it promises it will not modify the state of this contract
    // (think of it as a readonly keyword)
    function get() public view returns (string memory) {
        return storedData;
    }

    // constructor
    constructor() public {
        creator = msg.sender;
        balances[msg.sender] = 1000;
    }

    // public keyword means it can be used by external calls, like from web3.js
    function setHighScore(uint256 newHighscore) public {
        highscore = newHighscore;
    }
}
