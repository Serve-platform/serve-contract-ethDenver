// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

abstract contract UserFreeze is Ownable {
  mapping(address => bool) private _frozen;

  event Freeze(address indexed who);
  event Unfreeze(address indexed who);

  modifier whenNotFrozen(address who) {
    require(!_frozen[who], "UserFreeze: This user is frozen");
    _;
  }

  function setFreeze(address who) external onlyOwner {
    _frozen[who] = true;
    emit Freeze(who);
  }

  function setUnfreeze(address who) external onlyOwner {
    _frozen[who] = false;
    emit Unfreeze(who);
  }

  function isFrozen(address who) external view returns (bool) {
    return _frozen[who];
  }
}