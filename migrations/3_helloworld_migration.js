const Helloworld = artifacts.require("Helloworld");
//const HelloworldPerm = artifacts.require("HelloworldPerm");

module.exports = function (deployer) {
  deployer.deploy(Helloworld, "Hello world constructor");
    

    // return deployer.deploy(HelloworldPerm, message);
  
};
