pragma solidity ^0.5.16;

contract Election {
	// Part 1 of tutorial
	// // Store candidate. Gets assigned a reader function automatically
	// string public candidate;

	// // Constructor
	// constructor() public {
	// 	candidate = "Lying Larry";
	// }

	// Part 2

	// Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// Store Candidate
	// Fetch Candidate
	// k->val pairing that matches candidate id to candidate
	// If add to candidates, change the state of the contract and writing to the blockchain
	// Persists candidates to storage. Interacts with data layer of blockchain. 
	// Creates fetching function automatically
	mapping(uint => Candidate) public candidates;

	// Store accounts that have voted
	mapping(address => bool) public voters;

	// voted event
	event votedEvent (
        uint indexed _candidateId
    );

	// Store Candidates Count
	uint public candidatesCount;

	constructor() public {
		addCandidate("Lying Larry");
		addCandidate("Cheating Charlie");
	}

	// Add candidates to candidates mapping
	function addCandidate(string memory _name) private {
		++candidatesCount;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {
		// check for voted before
		require(!voters[msg.sender]);
		// check for valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount); 
		// record that voter has voted
		// metadata that gets passed (msg), account from which function call sent (sender)
		voters[msg.sender] =true;
		// update candidate voteCount
		candidates[_candidateId].voteCount++;
	}
}