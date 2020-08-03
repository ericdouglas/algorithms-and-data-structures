const { hourglass, createSumList, createPivotList } = require('./hourglass')

describe('2d array DS - hourglass', () => {
  it('should return the max hourglass sum value - #hourglass', () => {
    const matrix = [
      [1, 1, 1, 0, 0, 0],
      [0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [0, 0, 2, 4, 4, 0],
      [0, 0, 0, 2, 0, 0],
      [0, 0, 1, 2, 4, 0],
    ]

    expect(hourglass(matrix)).toBe(19)
  })

  it.only('should return a list with all hourglasses summed - #createSumList', () => {
    const matrix = [
      [1, 0, 3, 1],
      [2, 0, 0, 1],
      [0, 1, 0, 0],
      [0, 1, 2, 0],
    ]

    expect(createSumList(matrix)).toEqual([7, 6, 6, 5])
  })

  it('should return a list with pivots position - #createPivotList', () => {
    expect(createPivotList(2, 2)).toEqual([
      [0, 0],
      [0, 1],
      [1, 0],
      [1, 1],
    ])
  })
})
