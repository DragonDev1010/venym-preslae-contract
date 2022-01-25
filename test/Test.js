require('chai')
    .use(require('chai-as-promised'))
    .should()

const {assert} = require('chai')

const DAOToken = artifacts.require('./DAOToken.sol')

const Web3 = require("web3");
const web3  = new Web3(`http://localhost:8545`);

contract('Burn Token Contract', (accounts) => {
    let daoToken, res
    before(async() => {
        daoToken = await DAOToken.deployed()
    })
    it('Create Token Proposal', async() => {
        res = await daoToken.totalSupply()
        console.log(res.toString())
        res = await daoToken.decimals()
        console.log(res.toString())
    })
    it('Token transfer', async() => {
        let bal_0 = await daoToken.balanceOf(accounts[0])
        let bal_1 = await daoToken.balanceOf(accounts[1])
        console.log(
            'balance zero: ', bal_0.toString(),
            'balance one: ', bal_1.toString()
        )
        res = await daoToken.transfer(accounts[1], web3.utils.toWei('1000', 'Gwei'))
        bal_0 = await daoToken.balanceOf(accounts[0])
        bal_1 = await daoToken.balanceOf(accounts[1])
        let bal_dev = await daoToken.balanceOf(accounts[9])
        console.log(
            'balance zero: ', bal_0.toString(),
            'balance one: ', bal_1.toString(),
            'balance dev: ', bal_dev.toString()
        )
    })
})