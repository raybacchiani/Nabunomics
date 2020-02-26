// Election artifact that represents the Smart Contract
var Election = artifacts.require("./Election.sol");

// Directive to deploy the contract
module.exports = function(deployer) {
  deployer.deploy(Election);
};