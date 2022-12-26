// SPDX-License-Identifier: MIT
// 0x1032ff678f420378ba5e5785778a051175049395 => smart contract address
pragma solidity ^0.8.7;

contract FeeCollector{
    
    address public owner;
    uint256 public balance;
    
    constructor(){
        owner = msg.sender;
    }


    receive() payable external{
        balance += msg.value;
    }

    function withdraw(uint amaount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amaount <= balance, "Insufficient funds");

        destAddr.transfer(amaount);
        balance -= amaount;
    }

}

