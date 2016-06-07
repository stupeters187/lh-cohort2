var filterFunction = require('./learnyounode6a.js');
var dir = process.argv[2];
var filterStr = process.argv[3];

filterFunction(dir, filterStr, function (error, list){
  if (error) {
    console.error('Error', error);
  }
  list.forEach(function (file) {
    console.log(file);
  });
});