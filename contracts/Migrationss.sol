// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract votingSystem{
    //4 parties are competing and voter has to select from this 4 parties/

    uint[4] public Votes;   //array where votes per party will be stored
    address[] participants;  //storing address to make sure one person wont be able to vote twice

    function  giveVote(uint _partyNumber) public{
        require(_partyNumber>=0 && _partyNumber<4);
        address voter = msg.sender;
        uint flag = 0;
        for(uint i =0;i<participants.length;i++){
            if(participants[i]==voter){
                flag=1;
            }
        }
        if(flag==0){
            participants.push(voter);
            for(uint i =0;i<Votes.length;i++){
                if(_partyNumber==i){
                    Votes[i]+=1;
                }
            }
        }
    }
    function totalVotes() public view returns(uint){ 
        uint totalvote=0;
        for(uint i=0;i<Votes.length;i++){
            totalvote+=Votes[i];
        }
        return totalvote;
    }
    function mostVoted() public view returns(uint){
        uint index =0;
        uint maxValue = 0;
        for(uint i=0;i<Votes.length;i++){
            if(Votes[i]>maxValue){
                index = i;
                maxValue=Votes[i];
            }
        }
        return index;
    }
}