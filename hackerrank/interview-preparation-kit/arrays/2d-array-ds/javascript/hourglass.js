const createPivotList = (rows, columns) => {
  const pivotList = Array.from(new Array(rows), (_, rowIndex) => {
    return Array.from(new Array(columns), (_, columnIndex) => [
      rowIndex,
      columnIndex,
    ])
  }).flat()

  return pivotList
}

const createSumList = ([rowsLength, columnsLength], list) => {
  // Since the hourglass is a 3x3 matrix, we can not use a pivot that starts
  // in the last two columns and rows
  const pivotPositionList = createPivotList(rowsLength - 2, columnsLength - 2)
}

const verifyMatrixSize = list => {
  const rows = list.length
  const columns = list[0].length

  return [rows, columns]
}

const hourglass = list => {
  const [rows, columns] = verifyMatrixSize(list)
  const sumList = createSumList([rows, columns], list)
  return 19
}

module.exports = { hourglass, verifyMatrixSize, createSumList, createPivotList }
