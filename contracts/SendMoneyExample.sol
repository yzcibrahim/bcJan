pragma solidity  >=0.7.0 <0.9.0;

contract SendMoneyExample{

    uint public balanceReceived;
    uint public lockedUntil;

    function receiveMoney() public payable {
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
        require(lockedUntil < block.timestamp,"it is still blocked");
        payable(msg.sender).transfer(getBalance());
        balanceReceived=0;
    }

    function withdrawMoneyTo(address payable _to) public{
        require(lockedUntil < block.timestamp,"it is still blocked");
        _to.transfer(this.getBalance());
        balanceReceived=0;
    }
}