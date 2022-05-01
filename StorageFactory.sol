//SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

//import because we need to deploy this contract
//to just interact with the contract without all the functions, we need interface not import, so inherit
import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage{
    //This contract creates a simple storage contract and stores them in an array
    //create an array first so we can access simple storage contracts we create
    SimpleStorage[] public simpleStorageArray;
    uint256 public contractCounter;

    constructor() public{
        contractCounter = 0;
    }

    function simplestorage() public{
        //create a new contract like below
        SimpleStorage simpleStorage = new SimpleStorage();

        //Add this new contract to our array so we can access it
        simpleStorageArray.push(simpleStorage);

        //increase the counter when contract gets created
        contractCounter++;
    }

    //function to retrieve store function within simple storage contract
    function sfStore(uint256 _simpleStorageIndex,uint256 _simpleStorageNumber) public{
        //To access a smartcontract, we need 2 main information:
        // 1. Address of the smart contract
        // 2. Absloute Binary Interface : ABI

        //define a variable to access smart contract and get it's address
        //SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        //simpleStorage.store(_simpleStorageNumber);

        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        //SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        //return simpleStorage.retrieve();
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
}
