// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
  SimpleStorage[] public listOfSimpleStorage;
  function createSimpleStorage() public {
    listOfSimpleStorage.push(new SimpleStorage());
  }

  function sfStore(uint256 _simpleStorageIndex, uint256 _newFavoriteNumber) public {
    SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
    mySimpleStorage.store(_newFavoriteNumber);
  }

  function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
    SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
    return mySimpleStorage.retrieve();
  }
}