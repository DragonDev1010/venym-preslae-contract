const DAOToken = artifacts.require("DAOToken");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(DAOToken, accounts[9]);
};
