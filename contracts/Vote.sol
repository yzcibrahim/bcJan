// SPDX-License-Identifier: GPL-3.0
pragma solidity  >=0.7.0 <0.9.0;

contract Vote{

    struct TopBalance {
    uint numOfVotes;
    address addr;
}

    mapping(address => uint) public Candidates;
    mapping(address => address) public Votes;
    mapping(uint => TopBalance) public TopThree;
    function vote(address votedAddress) public{
        require(Votes[msg.sender]==address(0),"you have already voted");
        Candidates[votedAddress]++;
        Votes[msg.sender]=votedAddress;
        if(Candidates[votedAddress]>TopThree[2].numOfVotes)
        {
            TopThree[2].addr=votedAddress;
            TopThree[2].numOfVotes=Candidates[votedAddress];
        }
        if(Candidates[votedAddress]>TopThree[1].numOfVotes)
        {
            TopThree[2].addr=TopThree[1].addr;
            TopThree[2].numOfVotes=TopThree[1].numOfVotes;
            
            TopThree[1].addr=votedAddress;
            TopThree[1].numOfVotes=Candidates[votedAddress];
        }

        if(Candidates[votedAddress]>TopThree[0].numOfVotes)
        {
            TopThree[1].addr=TopThree[0].addr;
            TopThree[1].numOfVotes=TopThree[0].numOfVotes;
            
            TopThree[0].addr=votedAddress;
            TopThree[0].numOfVotes=Candidates[votedAddress];
        }
        
    }


    function GetVoteOfAddress(address votedAddress) public view returns(uint){
        return Candidates[votedAddress];
    }



}