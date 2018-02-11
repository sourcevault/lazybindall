var p, cn, diff;
p = require("process");
cn = require("comma-number");
diff = function(ini, fin){
  var exit, I;
  exit = {};
  for (I in ini) {
    exit[I] = cn(fin[I] - ini[I]);
  }
  return exit;
};
module.exports = {
  mem: p.memoryUsage,
  diff: diff
};