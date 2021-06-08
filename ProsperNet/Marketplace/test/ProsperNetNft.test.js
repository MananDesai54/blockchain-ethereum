const { assert } = require('chai')

const Marketplace = artifacts.require('./ProsperNetNft.sol')

require('chai')
  .use(require('chai-as-promised'))
  .should()

contract('ProsperNetNft', ([deployer, seller, buyer]) => {
  let marketplace

  before(async () => {
    marketplace = await Marketplace.deployed()
  })

  describe('deployment', async () => {
    it('deploys successfully', async () => {
      const address = await marketplace.address
      assert.notEqual(address, 0x0)
      assert.notEqual(address, '')
      assert.notEqual(address, null)
      assert.notEqual(address, undefined)
    })
  })

  describe('NFT', async () => {
    let result

    before(async () => {
        result = await marketplace.createNft("abc", web3.utils.toWei('1', 'Ether'), { from: seller });
    })

    it('creates nft', async () => {
      // SUCCESS
      const event = result.logs[0].args;
      assert.equal(event.id, "abc", 'id is correct')
      assert.equal(event.price, '1000000000000000000', 'price is correct')
      assert.equal(event.artist, seller, "artist is correct")
      assert.equal(event.previousOwner, seller, 'previous owner is correct')
      assert.equal(event.owner, seller, 'owner is correct')
      assert.equal(event.status, 1, 'nft status is correct')
    })
  })
})
