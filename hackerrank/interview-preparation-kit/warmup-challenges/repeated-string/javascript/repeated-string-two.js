const repeatNTimes = (str, size) => {
  const length = str.length
  const response = { repeat: 0, fraction: size }

  if (length <= size) {
    response.repeat = Math.floor(size / length)
    response.fraction = size % length
  }

  return response
}

const countPattern = (str, pattern) => {
  const regex = new RegExp(pattern, 'g')
  const reducedString = str.replace(regex, '')

  return str.length - reducedString.length
}

const repeatedString = (str, size) => {
  const { repeat, fraction } = repeatNTimes(str, size)
  const stringFraction = str.slice(0, fraction)
  const patternOccurrenceInString = repeat ? countPattern(str, 'a') : ''
  const patternOccurrenceInFraction = countPattern(stringFraction, 'a')

  return patternOccurrenceInString * repeat + patternOccurrenceInFraction
}

module.exports = repeatedString
