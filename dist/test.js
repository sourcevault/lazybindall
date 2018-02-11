var lazybindall, ec, protos, vars1, v1, state1, v2, state2;
lazybindall = require("./main.js");
ec = function(val){
  process.exitCode = val;
};
protos = {};
protos.getState = function(){
  return this;
};
vars1 = {
  drink: "coffee",
  cups: 1,
  nest: {
    more: 'stuff'
  }
};
v1 = lazybindall(protos, vars1);
state1 = v1.getState();
if (!(state1.drink === 'coffee')) {
  ec(1);
}
if (!(state1.nest.more === 'stuff')) {
  ec(1);
}
if (!(state1 === vars1)) {
  ec(1);
}
v2 = lazybindall(protos, vars1);
if (!(v2 === v1)) {
  ec(1);
}
state2 = v2.getState();
if (!(state2 === state1)) {
  ec(1);
}