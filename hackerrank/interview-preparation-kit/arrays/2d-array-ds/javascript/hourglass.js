const createPivotList = (rows, columns) => {
  const pivotList = Array.from(new Array(rows), (_, rowIndex) => {
    return Array.from(new Array(columns), (_, columnIndex) => [
      rowIndex,
      columnIndex,
    ])
  }).flat()

  return pivotList
}

const createSumList = list => {
  const [rowsLength, columnsLength] = verifyMatrixSize(list)
  // Since the hourglass is a 3x3 matrix, we can not use a pivot that starts
  // in the last two columns and rows
  const pivotPositionList = createPivotList(rowsLength - 2, columnsLength - 2)
  const hourglassPattern = [
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 1],
    [2, 0],
    [2, 1],
    [2, 2],
  ]

  const result = pivotPositionList.map(([rowPosition, columnPosition]) => {
    return hourglassPattern.reduce((acc, [rowShift, columnShift]) => {
      return acc + list[rowPosition + rowShift][columnPosition + columnShift]
    }, 0)
  })

  return result
}

const verifyMatrixSize = list => {
  const rows = list.length
  const columns = list[0].length

  return [rows, columns]
}

const hourglass = list => {
  const [rows, columns] = verifyMatrixSize(list)
  const sumList = createSumList(list)
  const maxValue = Math.max(...sumList)

  return maxValue
}

module.exports = { hourglass, verifyMatrixSize, createSumList, createPivotList }
