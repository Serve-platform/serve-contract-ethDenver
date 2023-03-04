// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "./UserFreeze.sol";

contract Serveway is ERC20, Pausable, Ownable, UserFreeze {
  string constant private _name = "Serveway Token (test coin)";
  string constant private _symbol = "SEAT";
  uint8 constant private _decimals = 18;
  uint256 constant private _initial_supply = 100_000_000;

  constructor() ERC20(_name, _symbol) Ownable() Pausable() {
    _mint(_msgSender(), _initial_supply * (10 ** uint256(_decimals)));
  }
  function mint(
    address account_,
    uint256 amount_
  ) external onlyOwner {
    _mint(account_, amount_);
  }
  function burn(
    address account_,
    uint256 amount_
  ) external onlyOwner {
    _burn(account_, amount_);
  }
  function setPause() external onlyOwner {
    _pause();
  }
  function setUnpause() external onlyOwner {
    _unpause();
  }
  function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 amount_
  ) internal virtual override
  whenNotPaused
  whenNotFrozen(from_)
  {
    super._beforeTokenTransfer(from_, to_, amount_);
  }
}