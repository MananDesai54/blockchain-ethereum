const Marketplace = artifacts.require("ProsperNetNft");

module.exports = function(deployer) {
  deployer.deploy(Marketplace);
};
