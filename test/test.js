var MyContract = artifacts.require("EmploymentAgreement")

contract('EmploymentAgreement', (accounts) => {

  it('get ETH price', function(done){
        MyContract.deployed().then(async function(instance) {
            const address = await instance.address;
            const agreement = MyContract.at(address);
            const ehtPrice = await agreement.getUSD();
            
            //assert(tokenAddress, 'Token address couldn\'t be stored');
            console.log(ethPrice);
            done();
       });
    });
});
