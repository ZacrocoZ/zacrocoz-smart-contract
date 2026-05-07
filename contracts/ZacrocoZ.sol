// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/*
ZacrocoZ (ZRZ)
110 Million Fixed Supply
No Mint
No Tax
No Upgradeable
BNB Chain (Chain ID 56)
Audit Friendly
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZacrocoZ is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY = 110_000_000 * 10**18;

    constructor(address initialOwner)
        ERC20("ZacrocoZ", "ZRZ")
        Ownable(initialOwner)
    {
        require(initialOwner != address(0), "Invalid owner");
        _mint(initialOwner, MAX_SUPPLY);
    }

    // Public burn → strong investor trust
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}

