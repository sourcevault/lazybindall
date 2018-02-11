
lazybindall = require "./main.js"


ec = (val) !->

  process.exitCode = val


protos = {}

protos.getState = -> @

vars1 = (drink:"coffee",cups:1,nest:(more:'stuff'))

v1 = lazybindall protos,vars1

state1 = v1.getState!

if not (state1.drink is 'coffee')

  ec 1


if not (state1.nest.more is 'stuff')

  ec 1


if not (state1 == vars1)

  ec 1


v2 = lazybindall protos,vars1

if not (v2 == v1)

  ec 1


state2 = v2.getState!


if not (state2 == state1)

  ec 1

