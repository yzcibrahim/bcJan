//pragma solidity ^0.5.11; 
pragma solidity  >=0.7.0 <0.9.0;

contract MyContract{
    string public myString = "Hello Solidity";
    uint public myInt;

    function setStr(string memory s) public {
    myString=s;
    }

    function incrInt() public{
        myInt++;
    }

    function decrInt() public{
        myInt--;
    }
}