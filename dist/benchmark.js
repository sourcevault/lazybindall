var letters, constant, genRandomName, genRandomAge, genOb, main, ref$, mem, diff, start, Tstart, fns, done, i$, I, len$, final, Tfinal;
letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
constant = function(x){
  return x;
};
genRandomName = function(){
  var length, ex, i$, I;
  length = Math.round(Math.random() * 25);
  ex = new Array(length);
  for (i$ = 0; i$ <= length; ++i$) {
    I = i$;
    ex.push(letters[Math.floor(Math.random() * letters.length)]);
  }
  return ex;
};
genRandomAge = function(ax){
  ax == null && (ax = 100);
  return Math.floor(ax * Math.random());
};
genOb = function(){
  return {
    name: genRandomName().join(""),
    age: genRandomAge()
  };
};
console.log("----------- NORMAL -----------");
main = function(){
  this.vars = genOb();
  return this;
};
main.of = function(){
  return new main();
};
main.prototype.f1 = function(){
  this.vars.age = genRandomAge();
};
main.prototype.f2 = function(){
  var ar, i$, to$, I;
  ar = [];
  for (i$ = 0, to$ = genRandomAge(10); i$ <= to$; ++i$) {
    I = i$;
    ar.push(letters[Math.floor(Math.random() * (letters.length - 9))]);
  }
  this.vars.name = ar;
};
main.prototype.f3 = function(){
  this.vars = genOb();
};
main.prototype.f4 = function(){
  this.vars.bottle = {};
  this.vars.bottle.name = genRandomName();
};
main.prototype.f5 = function(){
  this.vars.bottle = {};
  this.vars.bottle.age = genRandomName() + Math.floor(0.5 * genRandomName());
};
main.prototype.f6 = function(){
  this.vars.name = genRandomName();
};
main.prototype.f7 = function(){
  var ar, i$, to$, I, start, j$, to1$;
  ar = [];
  for (i$ = 0, to$ = genRandomAge(10); i$ <= to$; ++i$) {
    I = i$;
    start = Math.floor(Math.random() * (letters.length - 9));
    for (j$ = 0, to1$ = genRandomAge(10); j$ <= to1$; ++j$) {
      I = j$;
      ar.push(letters[Math.round(start * Math.random())]);
    }
  }
  this.vars.name = ar;
};
main.prototype.f8 = function(x){
  return constant(x);
};
main.prototype.state = function(x){
  return this;
};
ref$ = require("./mem.js"), mem = ref$.mem, diff = ref$.diff;
start = mem();
Tstart = new Date().getTime();
fns = [];
done = 0;
for (i$ = 0; i$ <= 10000; ++i$) {
  I = i$;
  fns.push(main.of());
}
for (i$ = 0, len$ = fns.length; i$ < len$; ++i$) {
  I = fns[i$];
  done += I.state().vars.age;
}
final = mem();
Tfinal = new Date().getTime();
console.log(diff(start, final));
console.log("Time :" + (Tfinal - Tstart));
console.log(done);