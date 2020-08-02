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
    //     const matrix = [
    //   [1, 2, 3, 4],
    //   [2, 1, 0, 1],
    //   [4, 1, 0, 5],
    //   [7, 4, 2, 5],
    // ]
    // expect(createSumList([3, 3], matrix)).toEqual([[0, 0]])
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
