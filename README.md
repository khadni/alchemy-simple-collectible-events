# Collectible Smart Contract

This is a smart contract for a collectible item, implemented in Solidity. The contract allows the owner to transfer the ownership of the collectible, set a mark price for the item, and sell it to a buyer for the specified price.

## **Events**

The contract emits four events:

### **Deployed**

Event emitted when the contract is deployed, indicating the address of the contract.

### **Transfer**

Event emitted when a transfer of ownership from one address to another occurs. The event contains the addresses of both the sender and the recipient.

### **ForSale**

Event emitted when the owner sets a mark price for the Collectible. The event contains the asking price and the current timestamp.

### **Purchase**

Event emitted when a buyer purchases the Collectible. The event contains the purchase amount and the buyer's address.

## **Variables**

The contract has three variables:

### **owner**

The address of the owner of the contract.

### **askingPrice**

The asking price for the Collectible.

### **forSale**

A boolean flag indicating whether the Collectible is for sale or not.

## **Functions**

The contract has three functions:

### **transfer**

A function that allows the owner of the contract to transfer the ownership of the Collectible to a new recipient. The function takes in the address of the new recipient as an argument and emits the Transfer event to signal that a transfer has been made.

### **markPrice**

A function that allows the owner of the contract to set a mark price for the Collectible. The function takes in the asking price as an argument and sets the Collectible for sale. The function emits the ForSale event to signal that the Collectible is for sale at the indicated mark price.

### **purchase**

A function that allows a buyer to purchase the Collectible for the specified price. The function checks that the amount sent by the buyer is greater than or equal to the asking price, and that the Collectible is for sale. If the checks pass, the function transfers the purchase amount to the contract owner, transfers ownership of the Collectible to the buyer, and marks the item as sold. The function emits the Purchase event to signal that the Collectible has been purchased.
