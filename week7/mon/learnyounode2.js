

var array = process.argv;
var total = 0;

for (var i = 2; i < array.length; i++) {
  total += Number(process.argv[i]);
}

console.log(total);
