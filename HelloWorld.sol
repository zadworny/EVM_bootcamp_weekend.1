// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 < 0.9.0;


/// @title EVM Bootcamp August 2024 Group-5 Week-1 Group Project


contract HelloWorld {
   /// @dev text is a private state variable to store any text
   string private text;
   /// @dev owner represents the owner of this Smart Contract
   address public owner;


   /// @dev onlyOwner modifier checks if the caller of the function is the onwer/deployer of the Smart Contract
   /// @dev if not, then it raises an error with text "Caller is not the owner"
   modifier onlyOwner()
   {
       require (msg.sender == owner, "Caller is not the owner");
       _;
   }


   /// @dev the address of the creator/deployer of this Smart Contract
   /// @dev also, initializes the text variable
   constructor() {
       text = initialText();
       owner = msg.sender;
   }


   /// @dev initialText() returns a string, "Hello World"
   function initialText() public pure virtual returns (string memory) {
       return "Hello World";
   }


   /// @dev helloWorld() function returns the state variable, 'text'
   function helloWorld() public view returns (string memory) {
       return text;
   }


   /// @dev only the deployer of the contract can change the state variable, 'text'
   /// @dev setText() function sets the state variable, 'text'   
   function setText(string calldata newText) public onlyOwner {
       require(msg.sender == owner);
       text = newText;
   }


   /// @dev this function changes the owner of the Smart Contract
   function transferOwnership(address newOwner) public onlyOwner {
       owner = newOwner;
   }


}