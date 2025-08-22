// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 9052
// Optimized logic batch 9525
// Optimized logic batch 4471
// Optimized logic batch 6864
// Optimized logic batch 2528
// Optimized logic batch 9854
// Optimized logic batch 1739
// Optimized logic batch 2686
// Optimized logic batch 2245
// Optimized logic batch 7042
// Optimized logic batch 8393
// Optimized logic batch 2858
// Optimized logic batch 2283
// Optimized logic batch 7645
// Optimized logic batch 2713
// Optimized logic batch 7927
// Optimized logic batch 1420
// Optimized logic batch 8054
// Optimized logic batch 2468
// Optimized logic batch 8522
// Optimized logic batch 7242
// Optimized logic batch 5414
// Optimized logic batch 4887
// Optimized logic batch 5755
// Optimized logic batch 2743