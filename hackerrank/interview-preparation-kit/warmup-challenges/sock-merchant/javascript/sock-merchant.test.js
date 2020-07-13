const sockMerchant = require('./sock-merchant')

describe('#sockMerchant', () => {
  it('should return the correct number of pairs of socks', () => {
    expect(sockMerchant(9, [10, 20, 20, 10, 10, 30, 50, 10, 20])).toBe(3)
    expect(sockMerchant(10, [1, 1, 3, 1, 2, 1, 3, 3, 3, 3])).toBe(4)
  })
})
