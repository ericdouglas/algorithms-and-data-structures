const { jumpingOnClouds } = require('./clouds')

describe('jumping on clouds', () => {
  it('should return the correct number of jumps', () => {
    expect(jumpingOnClouds([0, 0, 1, 0, 0, 1, 0])).toBe(4)
    expect(jumpingOnClouds([0, 0, 0, 0, 1, 0])).toBe(3)
    expect(jumpingOnClouds([0, 0, 0, 1, 0, 0])).toBe(3)
  })
})
