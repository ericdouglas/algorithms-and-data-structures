const countPath = (acc, next) => {
  const { valley, mountain, current } = acc
  const newStep = next == 'D' ? -1 : 1
  const newPlace = current + newStep

  if (current == 0 && newStep < 0)
    return { valley: valley + 1, mountain, current: newPlace }

  if (current == 0 && newStep > 0)
    return { valley, mountain: mountain + 1, current: newPlace }

  return { valley, mountain, current: newPlace }
}

const countingValleys = (_size, path) => {
  const result = path
    .split('')
    .reduce(countPath, { valley: 0, mountain: 0, current: 0 })

  return result.valley
}

module.exports = countingValleys
