// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {
    struct Penalty {
        uint256 amount;
        uint256 timestamp;
    }
    

    struct Item {
        string name;
        uint256 cost;
    }

    mapping(address => Penalty) private _penalties;
    mapping(uint256 => Item) private _items; 

    mapping(address => uint256[]) private _redeemedItems; 

    uint256 public penaltyAmount;

    event PenaltyApplied(address indexed player, uint256 amount, uint256 timestamp);
    event TokensRedeemed(address indexed user, uint256 amount);
    event ItemRedeemed(address indexed user, uint256 indexed itemId, uint256 cost);

    constructor() ERC20("DEGEN", "DGN") Ownable(msg.sender) {
        penaltyAmount = 0;

       
        _items[1] = Item("Hayato Character", 10); 
        _items[2] = Item("Weapon Skin", 20); 
        _items[3] = Item("Desert Map", 30); 
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

    
    function payOffPenalty() external {
        require(_penalties[msg.sender].timestamp > 0, "No active penalty");

         
       uint256 amount = _penalties[msg.sender].amount;
      _transfer(msg.sender, owner(), amount);

        
       delete _penalties[msg.sender];
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

  

    function getItem(uint256 itemId) external view returns (string memory name, uint256 cost) { 
        require(bytes(_items[itemId].name).length > 0, "Item does not exist");
        Item memory item = _items[itemId];
        return (item.name, item.cost);
    }

    function getRedeemedItems(address user) external view returns (uint256[] memory) { 
        return _redeemedItems[user];
    }

    function redeemItem(uint256 itemId) external { 
        Item memory item = _items[itemId];
        require(bytes(item.name).length > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= item.cost, "Insufficient balance to redeem item");

        _burn(msg.sender, item.cost);
        _redeemedItems[msg.sender].push(itemId); 
        emit ItemRedeemed(msg.sender, itemId, item.cost);
        
    }
}
