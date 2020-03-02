// Nabunomics artifact represents Genome addition and transactions
var Nabunomics = artifacts.require("./Nabunomics.sol");

// Directive to deploy the contract
module.exports = function(deployer) {
	deployer.deploy(Nabunomics);
};