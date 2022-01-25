// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
// import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import './ERC20.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract DAOToken is ERC20, Ownable{
    using SafeMath for uint256;
    address payable public devWallet;
    constructor(address payable devWalletAddr) ERC20("VenymDAO", "VNM"){
        _mint(msg.sender, 100000000000000000);
        devWallet = devWalletAddr;
    }
    function decimals() public view virtual override returns (uint8) {
        return 9;
    }
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        _transfer(_msgSender(), devWallet, amount.mul(1).div(100));
        return true;
    }
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _transfer(sender, devWallet, amount.mul(1).div(100));
        uint256 currentAllowance = allowance(sender, _msgSender());
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount.mul(101).div(100));
        }

        return true;
    }
    function setDevWallet(address payable newDev_) public onlyOwner {
        require(newDev_ != address(0), 'DAOToken.setDevWallet: ');
        devWallet = newDev_;
    }
}