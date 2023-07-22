// write a smart contract that implements the require(), assert() and revert() statements.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract CustomContract {
    address public owner;
    // unsigned integer of 256 bits
    uint256 public value;

    constructor() {
        // predefined global variable, represents the address of the account that is deploying the contract
        owner = msg.sender; 
    }

    // Function to set the contract value, only the owner can do this
    function setValue(uint256 _newValue) external {
        // Using require to check the condition
        require(msg.sender == owner, "Only the owner can set the value");

        value = _newValue;
    }

    // Function to withdraw the contract balance, only the owner can do this
    function withdrawBalance() external {
        // Using assert to check an invariant
        assert(address(this).balance > 0);

        // Using require with a condition that should never be true
        require(false, "This require statement should always revert");

        // This line will never be executed due to the previous require statement
        payable(owner).transfer(address(this).balance);

        // Using revert() to explicitly revert the transaction
        revert("Transaction explicitly reverted");
    }
}
