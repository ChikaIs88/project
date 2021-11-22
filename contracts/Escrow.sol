// SPDX-License-Identifier: MIT
pragma solidity >=0.8.6;

contract Escrow {
    address public buyer;
    address payable public landlord;
    address public agent;
    
    // @notice Logs the address of the sender and amounts paid to the contract
    event Paid(address indexed _from, uint _value);
    // @notice Logs the approval
    event Approved(address indexed _from);

    modifier onlyDepositor() {
        require(msg.sender == buyer, "Only buyer can call this method");
        _;
    }

    modifier onlyAgent() {
        require(msg.sender == agent, "Only agent can call this method");
        _;
    }

    constructor() {
        agent = msg.sender;
    }

    function addLandlord(address payable _landlord) public {
        landlord = _landlord;
    }

    function addBuyer(address _buyer) external{
        buyer = _buyer;
    }

    function landlordAddress() external view returns (address){
        return landlord;
    }

    function agentAddress() external view returns (address){
        return agent;
    }

    function contractBalance() public view returns(uint256) {
    return address(this).balance;
    }

    function depositEther() external payable onlyDepositor {
        emit Paid(msg.sender, msg.value);
    }

    function approve() public onlyAgent {
        emit Approved(msg.sender);
        uint256 balance = address(this).balance;
        landlord.transfer(balance);
    }
}