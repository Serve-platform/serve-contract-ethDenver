// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ServeNFT is ERC721Enumerable, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  string private _buri;
  mapping(address => bool) private _whitelist;

  event AddWhitelist(address indexed who);
  event RemoveWhitelist(address indexed who);

  constructor() ERC721("Serveway NFT (test coin)", "ServeNFT") {}

  function _baseURI() internal view override returns (string memory) {
    return _buri;
  }
  function setBaseURI(string memory buri_) external onlyOwner {
    require(bytes(buri_).length > 0, "wrong base uri");
    _buri = buri_;
  }

  modifier includedWhitelist(address who_) {
    require(_whitelist[who_], "This user is not included in the whitelist");
    _;
  }
  function addWhitelist(address who_) external onlyOwner {
    _whitelist[who_] = true;
    emit AddWhitelist(who_);
  }
  function removeWhitelist(address who_) external onlyOwner {
    _whitelist[who_] = false;
    emit RemoveWhitelist(who_);
  }
  function verifyWhitelist(address who_) external view returns (bool) {
    return _whitelist[who_];
  }

  function mint(
    address recipient_
  ) external includedWhitelist(_msgSender()) {
    _tokenIds.increment();
    uint256 tokenId = _tokenIds.current();
    _safeMint(recipient_, tokenId);
  }
  function mintBulk(
    address[] memory recipients_
  ) external includedWhitelist(_msgSender()) {
    _tokenIds.increment();
    uint256 tokenId = _tokenIds.current();
    require(
      recipients_.length <= 100,
      "Bulk mints are limited to 100 at a time."
    );
    for (uint256 i = 0; i < recipients_.length; i++) {
      _safeMint(recipients_[0], tokenId + i);
    }
  }

  function burn(uint256 tokenId_) external virtual {
    require(
      _isApprovedOrOwner(_msgSender(), tokenId_),
      "burn caller is not owner nor approved"
    );
    _burn(tokenId_);
  }
}