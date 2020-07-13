/**
 * Return the number of pairs of socks
 *
 * @param {number} size
 * @param {[number]} list
 * @returns {number} number of pairs of socks
 */
const sockMerchant = (size, list) => {
  const separatedList = list.reduce((map, value) => {
    const keyExists = !!map[value]

    return keyExists
      ? { ...map, [value]: [...map[value], value] }
      : { ...map, [value]: [value] }
  }, {})

  const numberOfPairs = Object.keys(separatedList).reduce((sum, value) => {
    const numberOfItems = separatedList[value].length
    const pairs = Math.floor(numberOfItems / 2)

    return sum + pairs
  }, 0)

  return numberOfPairs
}

module.exports = sockMerchant
