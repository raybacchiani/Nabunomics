pragma solidity ^0.5.16;

contract Election {

	// Store candidate. Gets assigned a reader function automatically
	string public candidate;

	// Constructor
	constructor() public {
		candidate = "Lying Larry";
	}
}