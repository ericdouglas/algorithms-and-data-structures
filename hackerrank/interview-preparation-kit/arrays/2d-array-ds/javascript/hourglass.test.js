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

  it('should return a list with all hourglasses summed - #createSumList', () => {
    const matrixOne = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
    ]
    const matrixTwo = [
      [1, 0, 3, 1],
      [2, 0, 0, 1],
      [0, 1, 0, 0],
      [0, 1, 2, 0],
    ]

    expect(createSumList(matrixOne)).toEqual([28])
    expect(createSumList(matrixTwo)).toEqual([5, 5, 6, 4])
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
