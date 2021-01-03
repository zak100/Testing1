var victim   = artifacts.require("./Victim");
var attacker = artifacts.require("./Attacker");


module.exports = function(deployer, network, accounts){
   deployer.deploy(victim).then(function(){
   return deployer.deploy(attacker, victim.address);});
   
};
