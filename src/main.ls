
run = (self,f) -> -> f.apply self,arguments

makeClose_ = (self,props,key,allFns) ->

  locked = run self,props[key]

  allFns[key] = locked

  locked

found = {}

found.vars = {}


found.vars.true = (props,wm,self,key) ->

  allFns = wm.get self

  if allFns[key]

    allFns[key]

  else

    makeClose_ self,props,key,allFns


found.vars.false = (props,wm,self,key) ->

    allFns = {}

    wm.set self, allFns

    makeClose_ self,props,key,allFns


get = (props,wm,self,key) -> (found.vars[(wm.has self)]) props,wm,self,key


_get = (props,wp) -> (self,key) ->

  if (key is "valueOf") or (props[key] is undefined)

    null

  else

    get props,wp,self,key


gen-get = (props) ->

  wm = new WeakMap()

  (get:_get props,wm)



found.props = {}

getMap = new WeakMap()

found.props.true = (props,vars) ->

  data = getMap.get props

  {proxMap} = data

  if proxMap.has vars

    proxMap.get vars

  else

    p = new Proxy vars,data.get

    proxMap.set vars,p

    p



found.props.false = (props,vars) ->

  get = gen-get props

  p = new Proxy vars,get

  proxMap = new WeakMap()

  proxMap.set vars,p

  data = {get,proxMap}

  getMap.set props,data

  p

create = (props,vars) -> found.props[(getMap.has props)] props,vars

module.exports = create