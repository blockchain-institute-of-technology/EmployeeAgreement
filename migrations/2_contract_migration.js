var EmploymentAgreement = artifacts.require("./EmploymentAgreement.sol");
//var usingOradlize = artifacts.require("./usingOraclize.sol");
module.exports = function(deployer) {
	//deployer.deploy(usingOradlize);
  deployer.deploy(EmploymentAgreement);
};
