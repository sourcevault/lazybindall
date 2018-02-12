var run, makeClose_, found, get, _get, genGet, getMap, create;
run = function(self, f){
  return function(){
    return f.apply(self, arguments);
  };
};
makeClose_ = function(self, props, key, allFns){
  var locked;
  locked = run(self, props[key]);
  allFns[key] = locked;
  return locked;
};
found = {};
found.vars = {};
found.vars['true'] = function(props, wm, self, key){
  var allFns;
  allFns = wm.get(self);
  if (allFns[key]) {
    return allFns[key];
  } else {
    return makeClose_(self, props, key, allFns);
  }
};
found.vars['false'] = function(props, wm, self, key){
  var allFns;
  allFns = {};
  wm.set(self, allFns);
  return makeClose_(self, props, key, allFns);
};
get = function(props, wm, self, key){
  return found.vars[wm.has(self)](props, wm, self, key);
};
_get = function(props, wp){
  return function(self, key){
    if (key === "valueOf" || props[key] === undefined) {
      return null;
    } else {
      return get(props, wp, self, key);
    }
  };
};
genGet = function(props){
  var wm;
  wm = new WeakMap();
  return {
    get: _get(props, wm)
  };
};
found.props = {};
getMap = new WeakMap();
found.props['true'] = function(props, vars){
  var data, proxMap, p;
  data = getMap.get(props);
  proxMap = data.proxMap;
  if (proxMap.has(vars)) {
    return proxMap.get(vars);
  } else {
    p = new Proxy(vars, data.get);
    proxMap.set(vars, p);
    return p;
  }
};
found.props['false'] = function(props, vars){
  var get, p, proxMap, data;
  get = genGet(props);
  p = new Proxy(vars, get);
  proxMap = new WeakMap();
  proxMap.set(vars, p);
  data = {
    get: get,
    proxMap: proxMap
  };
  getMap.set(props, data);
  return p;
};
create = function(props, vars){
  return found.props[getMap.has(props)](props, vars);
};
module.exports = create;