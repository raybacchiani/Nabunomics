 var Election = artifacts.require("./Election.sol");

 contract("Election", function(accounts) {

 	var electionInstance;

 	it("initializes with two candidates", function() {
 		return Election.deployed().then(function(instance) {
 			return instance.candidatesCount();
 		}).then(function(count) {
 			assert.equal(count, 2);
 		});
 	});

 	it("initializes the candidates with the correct values", function() {
 		return Election.deployed().then(function(instance) {
 			electionInstance = instance;
 			return electionInstance.candidates(1);
 		}).then(function(candidate) {
 			assert.equal(candidate.id, 1, "contains the correct id");
 			assert.equal(candidate.name, "Lying Larry", "contains the correct name");
 			assert.equal(candidate.voteCount, 0, "contains the correct voteCount");
 			return electionInstance.candidates(2);
 		}).then(function(candidate) {
 			assert.equal(candidate.id, 2, "contains the correct id");
 			assert.equal(candidate.name, "Cheating Charlie", "contains the correct name");
 			assert.equal(candidate.voteCount, 0, "contains the correct voteCount");
 		});
 	});

 	it("allows a voter to cast a vote", function() {
 		return Election.deployed().then(function(instance) {
 			electionInstance = instance;
 			candidateId = 1;
 			return electionInstance.vote(candidateId, {from: accounts[0]}); 
 		}).then(function(receipt) {
 			return electionInstance.voters(accounts[0]);
 		}).then(function(voted) {
 			assert(voted, "the voter was marked as voted");
 			return electionInstance.candidates(candidateId);
 		}).then(function(candidate) {
 			var voteCount = candidate[2];
 			assert.equal(voteCount, 1, "increments the candidate's vote count");
 		})
 	}); 
 });