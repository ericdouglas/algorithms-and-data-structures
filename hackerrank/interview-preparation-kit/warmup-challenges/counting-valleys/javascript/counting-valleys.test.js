const countingValleys = require('./counting-valleys')

describe('#countingValleys', () => {
  it('should return the correct valleys', () => {
    expect(countingValleys(8, 'UDDDUDUU')).toBe(1)
    expect(countingValleys(12, 'DDUUDDUDUUUD')).toBe(2)
  })
})
