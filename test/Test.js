require('chai')
    .use(require('chai-as-promised'))
    .should()

const {assert} = require('chai')

const DAOToken = artifacts.require('./DAOToken.sol')

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
    
})