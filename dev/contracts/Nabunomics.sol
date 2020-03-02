pragma solidity ^0.5.16;

contract Nabunomics {

	// Create a Genome container
	struct Genome {
		uint id;
		string seq;
		address owner;
		string source_type;
		address[] memory shared = new string[]
	}

	// additions to mappings and address arrays changes state of contract.
	// changing state of contract means writing to blockchain
	
	// mapping of publically available genomes to be bid on via id
	mapping(uint => Genome) public pubGenomes;
	uint pubGenomesCount;

	// mapping of hidden genomes via id. Opt out of trading
	mapping(uint => Genome) private privGenomes;
	uint privGenomesCount;

	// pubGenomesCount + privGenomesCount == genomesCount;

	// list of addresses of entities that may request genomes
	address[] public members;
	uint public membersCount;


	// voted event
	// keep for reference
	// event votedEvent (
 //        uint indexed _candidateId
 //    );

	constructor() public {
		addGenome("")
		// addCandidate("Lying Larry");
		// addCandidate("Cheating Charlie");
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