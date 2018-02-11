letters = [ "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" ]

constant = (x) -> x

genRandomName = ->

  length = Math.round (Math.random! * 25)


  ex = new Array(length)

  for I from 0 to length

    ex.push letters[ Math.floor ((Math.random!)*letters.length) ]


  ex

genRandomAge = (ax = 100)-> Math.floor (ax*Math.random!)

genOb = -> (name :((genRandomName!).join "") , age :genRandomAge!)

# ↓      NORMAL ↓

console.log "----------- NORMAL -----------"

main = ->

  @vars = genOb!

  @

main.of = -> new main()


main.prototype.f1 = !->

  @vars.age = genRandomAge!

main.prototype.f2 = !->

  ar = []

  for I from 0 to (genRandomAge 10)

    ar.push letters[Math.floor ((Math.random!)*(letters.length - 9))]


  @vars.name = ar

main.prototype.f3 = !->

  @vars = genOb!


main.prototype.f4 = !->

  @vars.bottle = {}

  @vars.bottle.name = genRandomName!

main.prototype.f5 = !->

  @vars.bottle = {}

  @vars.bottle.age = genRandomName! + Math.floor (0.5*genRandomName!)


main.prototype.f6 = !->

  @vars.name = genRandomName!

main.prototype.f7 = !->

  ar = []

  for I from 0 to (genRandomAge 10)

    start = Math.floor ((Math.random!)*(letters.length - 9))

    for I from 0 to (genRandomAge 10)

      ar.push letters[Math.round(start*Math.random!)]

  @vars.name = ar

main.prototype.f8 = (x) -> constant x

main.prototype.state = (x) -> @

# ↑ NORMAL ↑

# ↓ BINDALL ↓

# console.log "--------BINDALL---------"

# protos = {}

# protos.f1 = !->

# 	@vars.age = genRandomAge!

# protos.f2 = !->

# 	ar = []

# 	for I from 0 to (genRandomAge 10)

# 		ar.push letters[Math.floor ((Math.random!)*(letters.length - 9))]


# 	@vars.name = ar

# protos.f3 = !->

# 	@vars = genOb!


# protos.f4 = !->

# 	@vars.bottle = {}

# 	@vars.bottle.name = genRandomName!

# protos.f5 = !->

# 	@vars.bottle = {}

# 	@vars.bottle.age = genRandomName! + Math.floor (0.5*genRandomName!)


# protos.f6 = !->

# 	@vars.name = genRandomName!

# protos.f7 = !->

# 	ar = []

# 	for I from 0 to (genRandomAge 10)

# 		start = Math.floor ((Math.random!)*(letters.length - 9))

# 		for I from 0 to (genRandomAge 10)

# 			ar.push letters[Math.round(start*Math.random!)]

# 	@vars.name = ar

# protos.f8 = (x) -> constant x

# protos.state = -> @


# main = {}

# bindall = require "@sourcevault/bindall"

# main.of = ->

# 	proxy = {}

# 	proxy.vars = genOb!

# 	ret = bindall proxy , protos

# 	ret

# ↑ BINDALL ↑

# ↓ PROXY-LAZYBINDALL ↓

# console.log "--------PROXY-LAZYBINDALL---------"

# protos = {}

# protos.f1 = !->

# 	# @vars.age = genRandomAge!

# protos.f2 = !->

# 	ar = []

# 	for I from 0 to (genRandomAge 10)

# 		ar.push letters[Math.floor ((Math.random!)*(letters.length - 9))]


# 	# @vars.name = ar

# protos.f3 = !->

# 	# @vars = genOb!


# protos.f4 = !->

# 	# @vars.bottle = {}

# 	# @vars.bottle.name = genRandomName!

# protos.f5 = !->

# 	# @vars.bottle = {}

# 	# @vars.bottle.age = genRandomName! + Math.floor (0.5*genRandomName!)


# protos.f6 = !->

# 	# @vars.name = genRandomName!

# protos.f7 = !->

# 	# ar = []

# 	# for I from 0 to (genRandomAge 10)

# 		# start = Math.floor ((Math.random!)*(letters.length - 9))

# 		# for I from 0 to (genRandomAge 10)

# 			# ar.push letters[Math.round(start*Math.random!)]

# 	# @vars.name = ar

# protos.f8 = (x) -> constant x

# protos.state = (x) !->


# main = {}

# lba = require "./main.js"

# main.of = ->

# 	proxy = {}

# 	proxy.vars = genOb!

# 	ret = lba protos,proxy

# 	ret


# ↑ PROXY-LAZYBINDALL ↑



{mem,diff} = require "./mem.js"

start = mem!


Tstart = (new Date!).getTime!


fns = []

done = 0

for I from 0 to 10000

  fns.push main.of!

for I in fns

  done += (I.state!).vars.age



final = mem!

Tfinal = (new Date!).getTime!

console.log diff start,final

console.log "Time :"  + (Tfinal - Tstart)

console.log done
