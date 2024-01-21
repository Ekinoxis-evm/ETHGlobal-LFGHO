// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/// @custom:security-contact ekinoxis.evm@gmail.com
contract PesoCrossChain is ERC20, ERC20Burnable, AccessControl, ERC20Permit {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address defaultAdmin, address minter)
        ERC20("Peso CrossChain", "COPX")
        ERC20Permit("Peso CrossChain")
    {
        _mint(msg.sender, 10000 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}
// Contract: 
// Owner: 0xFfcaFD4ab6e8AA5ea07E681703786fE593186771
// Minter 1 : 0xFfcaFD4ab6e8AA5ea07E681703786fE593186771
// Minter 2: 0x8d3F29A5CA03a49CF1f6E6Bd1d546710C4D4BbDE
