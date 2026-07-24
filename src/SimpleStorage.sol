//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract SimpleStorage{
  // variables
  uint256 public favoriteNumber;
  struct Person{
    uint256 favoriteNumber;
    string name;
  }

  Person[] public people;
  mapping(string => uint256) public nameToFavNumber;
  
  // events
  event favoriteNumberChanged(uint256 number);
  
  function name() public pure returns(string memory){
    return "Simple Storage";
  }
  function retrieve() public view returns(uint256){
    return favoriteNumber;
  }
  function store(uint256 _favoriteNumber) public virtual {
    favoriteNumber = _favoriteNumber;
    emit favoriteNumberChanged(_favoriteNumber);
  }
  function addPerson(string memory _name, uint256 _favoriteNumber) public {
    people.push(Person(_favoriteNumber, _name));
    nameToFavNumber[_name] = _favoriteNumber;
  }
}