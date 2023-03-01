// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {

    // Event emitted when the contract is deployed.
    event Deployed(address indexed _addr);

    // Event emitted when a transfer from a _sender address to the _recipient address is made.
    event Transfer(address indexed _sender, address indexed _recipient);

    // Event emitted when the owner sets a mark price for the sale of the Collectible.
    event ForSale(uint _price, uint _timestamp);

    // Event emitted when the _buyer purchases the Collectible for _amount.
    event Purchase(uint _amount, address indexed _buyer);

    // Address of the owner of the contract.
    address owner;

    // Asking price for the Collectible.
    uint askingPrice;

    // Flag indicating whether the Collectible is for sale or not.
    bool forSale;

    // Constructor function that sets the owner of the contract and emits the Deployed event.
    constructor() {
        // Set the owner of the contract to the address of the account that deploys the contract.
        owner = msg.sender;
        // Emit the Deployed event, passing in the address of the contract owner.
        emit Deployed(owner);
    }

    // Function that allows the owner of the contract to transfer the Collectible to a new recipient.
    function transfer(address _recipient) external {
        // Check that the caller of the function is the contract owner.
        require(msg.sender == owner, "Only the owner can transfer the Collectible.");
        // Transfer the ownership of the Collectible to the new recipient.
        owner = _recipient;
        // Emit the Transfer event to signal that a transfer has been made.
        emit Transfer(msg.sender, _recipient);
    }

    // Function that allows the owner of the contract to set a mark price for the Collectible.
    function markPrice(uint _askingPrice) external {
        // Check that the caller of the function is the contract owner.
        require(owner == msg.sender, "Only the owner can set a mark price.");

        // Update the asking price and set the Collectible for sale.
        askingPrice = _askingPrice;
        forSale = true;

        // Emit the ForSale event to signal that the Collectible is for sale at the indicated mark price.
        // Pass in the asking price and the current timestamp as parameters to the event.
        emit ForSale(askingPrice, block.timestamp);
    }

    // Function that allows a buyer to purchase the Collectible.
    function purchase() external payable {
        // Check that the amount sent by the buyer is greater than or equal to the asking price.
        require(msg.value >= askingPrice, "Amount sent should be higher or equal to the asking price.");
        // Check that the Collectible is for sale.
        require(forSale, "The Collectible is not for sale.");
        // Transfer the purchase amount to the contract owner.
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success);
        // Transfer ownership of the Collectible to the buyer and mark it as sold.
        owner = msg.sender;
        forSale = false;
        // Emit the Purchase event to signal that the Collectible has been purchased.
        emit Purchase(msg.value, msg.sender);
    }
}