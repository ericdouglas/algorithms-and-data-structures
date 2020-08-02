const { hourglass } = require('./hourglass')

describe('2d array DS - hourglass', () => {
  it('should return the max hourglass sum value', () => {
    const input = [
      [1, 1, 1, 0, 0, 0],
      [0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [0, 0, 2, 4, 4, 0],
      [0, 0, 0, 2, 0, 0],
      [0, 0, 1, 2, 4, 0],
    ]

    expect(hourglass(input)).toBe(19)
  })
})
