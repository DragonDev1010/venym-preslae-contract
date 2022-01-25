// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract DAOToken is ERC20{
    constructor() ERC20("VenymDAO", "VNM"){
        _mint(msg.sender, 100000000000000000);
    }
    function decimals() public view virtual override returns (uint8) {
        return 9;
    }        
}