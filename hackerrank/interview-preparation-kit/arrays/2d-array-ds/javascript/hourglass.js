/**
 * @param {number} rows
 * @param {number} columns
 * @returns {[[number, number]]} array with the position of all first element (pivot) of the hourglass
 */
const createPivotList = (rows, columns) => {
  const pivotList = Array.from(new Array(rows), (_, rowIndex) => {
    return Array.from(new Array(columns), (_, columnIndex) => [
      rowIndex,
      columnIndex,
    ])
  }).flat()

  return pivotList
}

/**
 * @param {[[Number]]} list - 2d matrix
 * @returns {[number]} array with all hourglasses sum values
 */
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

/**
 * @param {[[Number]]} list - 2d matrix
 * @returns {[number, number]}
 */
const verifyMatrixSize = list => {
  const rows = list.length
  const columns = list[0].length

  return [rows, columns]
}

/**
 * @param {[[number]]} list - 2d matrix
 * @returns {number} max hourglass sum
 */
const hourglassSum = list => {
  const [rows, columns] = verifyMatrixSize(list)
  const sumList = createSumList(list)
  const maxValue = Math.max(...sumList)

  return maxValue
}

module.exports = {
  hourglassSum,
  verifyMatrixSize,
  createSumList,
  createPivotList,
}
