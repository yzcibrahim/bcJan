// SPDX-License-Identifier: GPL-3.0
pragma solidity  >=0.7.0 <0.9.0;

contract Bank{
    mapping(address => uint) public balances;
    address public owner;

    

    constructor()
    {
        owner=msg.sender;
    }

    function GetTotalBalance() public view returns(uint){
         return address(this).balance;
    }

    function Deposit() public payable
    {
        balances[msg.sender]+=msg.value;
    }

    function Withdraw(uint amount) public{
        require(amount<balances[msg.sender],"insufficent balance");
        payable(msg.sender).transfer(amount);
        balances[msg.sender]-=amount;
    }

    function transfer(address to, uint amount) public{
        require(balances[msg.sender]>=amount,"insuficcent balance");
        balances[to] += amount;
        balances[msg.sender] -= amount;
    }


}