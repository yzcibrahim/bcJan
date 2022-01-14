// SPDX-License-Identifier: GPL-3.0
pragma solidity  >=0.7.0 <0.9.0;

contract SendMoneyExample{

    uint public balanceReceived;
    uint public lockedUntil;
    address public owner;
    bool public paused;
    constructor()
    {
        owner = msg.sender;
    }

    function setPaused(bool _paused) public{
     require(msg.sender == owner,"you are not the owner");
        paused=_paused;
    }

    function receiveMoney() public payable {
        require(paused==false,"The Contract is puased");
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getCurrentTimeStamp() public view returns(uint){
    return block.timestamp;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney() public{
        require(msg.sender == owner,"you are not the owner");
        require(lockedUntil < block.timestamp,"it is still blocked");
        require(paused==false,"The Contract is puased");
        payable(msg.sender).transfer(getBalance());
        balanceReceived=0;
    }

    function withdrawMoneyTo(address payable _to) public{
        require(msg.sender == owner,"you are not the owner");
        require(lockedUntil < block.timestamp,"it is still blocked");
        require(paused==false,"The Contract is puased");
        _to.transfer(this.getBalance());
        balanceReceived=0;
    }
}