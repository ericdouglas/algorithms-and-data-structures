const repeatNTimes = (str, size) => {
  const length = str.length
  const response = { repeat: 0, fraction: 0 }

  if (length <= size) {
    response.repeat = Math.floor(size / length)
    response.fraction = size % length
  }

  return response
}

const repeatedString = (str, size) => {
  const { repeat, fraction } = repeatNTimes(str, size)
  let fullString = ''

  if (repeat === 0) {
    fullString = str.slice(0, size)
  } else {
    fullString = `${str.repeat(repeat)}${str.slice(0, fraction)}`
  }

  const reducedString = fullString.replace(/a/g, '')

  return fullString.length - reducedString.length
}

module.exports = repeatedString
