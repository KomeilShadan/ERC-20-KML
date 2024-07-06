// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Komeileum is ERC20, Ownable, ERC20Pausable, ERC20Burnable {

    string internal _name = "Komeileum";
    string internal _symbol =  "KML";
    uint8 internal _decimals = 18;
    uint256 internal _totalSupply = 100_000_000e18;

    mapping(address account => uint256 balance) internal _balances;
    mapping(address from => mapping(address to => uint256 transferLimit)) internal _allowed;

    event Mint(address indexed minter, address indexed account, uint256 amount);
    event Burn(address indexed burner, address indexed account, uint256 amount);


    constructor() 
        ERC20(_name, _symbol)
        Ownable(msg.sender)
    {
        mint(msg.sender, _totalSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner 
    {
        _mint(to, amount);

        emit Mint(msg.sender, to, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner 
    {
        _burn(account, amount);

        emit Burn(msg.sender, account, amount);
    }

    function puase() public onlyOwner 
    {
        return _pause();
    }

    function unpause() public onlyOwner 
    {
        return _unpause();
    }

    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Pausable)
    {
        return super._update(from, to, value);
    }
}