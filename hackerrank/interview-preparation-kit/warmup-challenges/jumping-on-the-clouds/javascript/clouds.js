const jump = (path, jumps) => {
  const [_current, next1, next2, ...rest] = path

  if (next1 === undefined) return jumps
  if (next2 === 0) return jump([next2, ...rest], jumps + 1)
  if (next1 === 0) return jump([next1, next2, ...rest], jumps + 1)
}

const jumpingOnClouds = path => jump(path, 0)

module.exports = { jumpingOnClouds }
