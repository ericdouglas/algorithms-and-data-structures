const repeatedString = require('./repeated-string')

describe('repeatedString', () => {
  it('should return the correct number of characters "a" in the string', () => {
    expect(repeatedString('dia', 7)).toBe(2)
    expect(repeatedString('amazing', 3)).toBe(2)
    expect(repeatedString('aba', 10)).toBe(7)
    expect(repeatedString('a', 100)).toBe(100)
  })
})
