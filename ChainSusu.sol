// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChainSusu {
    uint256 public groupSize;
    uint256 public contributionAmount;
    uint256 public intervalDays;
    bool public collateralRequired;
    uint256 public collateralAmount;

    address[] public groupMembers;
    mapping(address => bool) public hasJoined;
    mapping(address => uint256) public contributions;
    mapping(address => bool) public hasWithdrawnCollateral;

    address public owner;
    uint256 public creationTime;
    bool public groupIsFull;

    event GroupJoined(address indexed member);
    event ContributionMade(address indexed member, uint256 amount);
    event CollateralWithdrawn(address indexed member, uint256 amount);
    event LeftoverWithdrawn(address indexed member, uint256 amount);

    constructor(
        uint256 _groupSize,
        uint256 _contributionAmount,
        uint256 _intervalDays,
        bool _collateralRequired,
        uint256 _collateralAmount
    ) {
        owner = msg.sender;
        groupSize = _groupSize;
        contributionAmount = _contributionAmount;
        intervalDays = _intervalDays;
        collateralRequired = _collateralRequired;
        collateralAmount = _collateralAmount;
        creationTime = block.timestamp;
    }

    function joinGroup() external payable {
        require(!hasJoined[msg.sender], "Already joined");
        require(groupMembers.length < groupSize, "Group is full");

        uint256 totalAmount = contributionAmount;
        if (collateralRequired) {
            totalAmount += collateralAmount;
        }

        require(msg.value == totalAmount, "Incorrect total payment");

        hasJoined[msg.sender] = true;
        groupMembers.push(msg.sender);
        contributions[msg.sender] += contributionAmount;

        emit GroupJoined(msg.sender);

        if (groupMembers.length == groupSize) {
            groupIsFull = true;
        }
    }

    function contribute() external payable {
        require(hasJoined[msg.sender], "You must join the group first");
        require(msg.value == contributionAmount, "Incorrect contribution amount");

        contributions[msg.sender] += msg.value;

        emit ContributionMade(msg.sender, msg.value);
    }

    function withdrawCollateral() external {
        require(collateralRequired, "Collateral not required");
        require(hasJoined[msg.sender], "Not a group member");
        require(!hasWithdrawnCollateral[msg.sender], "Already withdrawn");

        hasWithdrawnCollateral[msg.sender] = true;
        payable(msg.sender).transfer(collateralAmount);

        emit CollateralWithdrawn(msg.sender, collateralAmount);
    }

    function withdrawLeftover() external {
        require(hasJoined[msg.sender], "Not a group member");
        require(address(this).balance > 0, "No leftover funds");

        uint256 share = address(this).balance / groupMembers.length;
        payable(msg.sender).transfer(share);

        emit LeftoverWithdrawn(msg.sender, share);
    }

    // ✅ FIX 1: Safe way to get group size
    function getMemberCount() public view returns (uint256) {
        return groupMembers.length;
    }

    // ✅ FIX 2: Access individual member address
    function getMemberAt(uint256 index) public view returns (address) {
        require(index < groupMembers.length, "Index out of bounds");
        return groupMembers[index];
    }

    // ❌ Removed: function getAllMembers() public view returns (address[] memory)
    // Because Remix and MetaMask can crash when reading dynamic arrays directly.
}
