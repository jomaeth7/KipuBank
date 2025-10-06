// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title KipuBank - Personal vault with withdrawal and global deposit limits
/// @author Jose Meijide
/// @notice Allows users to deposit and withdraw ETH with defined limits
/// @dev Implements security best practices, custom errors, and NatSpec documentation

contract KipuBank {
    // ============================
    // 🔒 Immutable variables
    // ============================

    /// @notice Maximum withdrawal allowed per transaction
    uint256 public immutable withdrawLimit;

    /// @notice Global deposit cap for the entire contract
    uint256 public immutable bankCap;

    // ============================
    // 🧠 Storage variables
    // ============================

    /// @notice Total ETH deposited in the contract
    uint256 public totalDeposited;

    /// @notice Total number of deposits made
    uint256 public depositCount;

    /// @notice Total number of withdrawals made
    uint256 public withdrawalCount;

    /// @notice Individual vault balances per user
    mapping(address => uint256) public vaults;

    // ============================
    // 📢 Events
    // ============================

    /// @notice Emitted when a user successfully deposits ETH
    event Deposited(address indexed user, uint256 amount);

    /// @notice Emitted when a user successfully withdraws ETH
    event Withdrawn(address indexed user, uint256 amount);

    // ============================
    // ❌ Custom errors
    // ============================

    /// @notice Thrown when a deposit exceeds the global bank cap
    error DepositLimitExceeded();

    /// @notice Thrown when a withdrawal exceeds the allowed transaction limit
    error WithdrawLimitExceeded();

    /// @notice Thrown when a user tries to withdraw more than their vault balance
    error InsufficientBalance();

    // ============================
    // 🏗️ Constructor
    // ============================

    /// @param _withdrawLimit Maximum withdrawal per transaction
    /// @param _bankCap Global deposit cap for the contract
    constructor(uint256 _withdrawLimit, uint256 _bankCap) {
        withdrawLimit = _withdrawLimit;
        bankCap = _bankCap;
    }

    // ============================
    // 🛡️ Modifier
    // ============================

    /// @notice Ensures the deposit does not exceed the global bank cap
    /// @param amount Amount being deposited
    modifier withinCap(uint256 amount) {
        if (totalDeposited + amount > bankCap) {
            revert DepositLimitExceeded();
        }
        _;
    }

    // ============================
    // 💰 External payable function
    // ============================

    /// @notice Allows users to deposit ETH into their personal vault
    /// @dev Uses the withinCap modifier and follows checks-effects-interactions
    function deposit() external payable withinCap(msg.value) {
        vaults[msg.sender] += msg.value;
        totalDeposited += msg.value;
        depositCount++;
        emit Deposited(msg.sender, msg.value);
    }

    // ============================
    // 🔒 Private function
    // ============================

    /// @notice Internal logic for processing withdrawals
    /// @param amount Amount to withdraw
    function _withdraw(uint256 amount) private {
        if (amount > withdrawLimit) revert WithdrawLimitExceeded();
        if (vaults[msg.sender] < amount) revert InsufficientBalance();

        vaults[msg.sender] -= amount;
        totalDeposited -= amount;
        withdrawalCount++;
        emit Withdrawn(msg.sender, amount);

        _safeTransfer(msg.sender, amount);
    }

    /// @notice Safely transfers ETH to the recipient
    /// @param to Recipient address
    /// @param amount Amount to transfer
    function _safeTransfer(address to, uint256 amount) private {
        (bool success, ) = to.call{value: amount}("");
        require(success, "Transfer failed");
    }

    // ============================
    // 🧾 External function
    // ============================

    /// @notice Allows users to withdraw ETH from their vault
    /// @param amount Amount to withdraw
    function withdraw(uint256 amount) external {
        _withdraw(amount);
    }

    // ============================
    // 👁️ View function
    // ============================

    /// @notice Returns the current vault balance of the caller
    /// @return balance Current ETH balance in the user's vault
    function getVaultBalance() external view returns (uint256) {
        return vaults[msg.sender];
    }
}
