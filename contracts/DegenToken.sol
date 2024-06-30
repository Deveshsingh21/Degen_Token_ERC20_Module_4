
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

 import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
 import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";
 import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {
    struct Penalty {
        uint256 amount;             
        uint256 timestamp;         
    }

    mapping(address => Penalty) private _penalties;

    uint256 public penaltyAmount;   

    event PenaltyApplied(address indexed player, uint256 amount, uint256 timestamp);
    event TokensRedeemed(address indexed user, uint256 amount);

    constructor() ERC20("DEGEN","DGN") {
        penaltyAmount = 0; 
    }

   
    function setPenaltyAmount(uint256 amount) external onlyOwner {
        penaltyAmount = amount;
    }

   
    function applyPenalty(address player) external onlyOwner {
        _penalties[player] = Penalty(penaltyAmount, block.timestamp);
        emit PenaltyApplied(player, penaltyAmount, block.timestamp);
    }

    function hasPenalty(address player) external view returns (bool) {
        return (_penalties[player].timestamp > 0);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
    function redeem(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to redeem Tokens on Degen Royale");
        _burn(msg.sender, amount);
        emit TokensRedeemed(msg.sender, amount);
       
      
    }
}



