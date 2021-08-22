const Dai = artifacts.require("dai");
const payment = artifacts.require("Payment");

module.exports = async function (deployer, network , addresses) {
  const [admin , user1 , user2 , _] = addresses ;
  //for ganache test net
  if(network === 'develop') {
    await deployer.deploy(Dai) ;
    const dai = await Dai.deployed() ;
    await dai.faucet(user1 , web3.utils.toWei('1000000'));
    await dai.faucet(user2 , web3.utils.toWei('2000000'));

    await deployer.deploy(payment, admin , dai.address) ;
  } 
  else{
  // For public test net or main net
    const admin_address = '' ;
    const dai_address = '' ;
    await deployer.deploy(payment , admin_address , dai_address) ;
  }
};
