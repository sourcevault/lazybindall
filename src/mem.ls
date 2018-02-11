p = require "process"

cn = require "comma-number"

diff = (ini,fin) ->

  exit = {}

  for I of ini

    exit[I] = cn (fin[I] - ini[I])

  exit


module.exports =
  mem:p.memoryUsage
  diff:diff