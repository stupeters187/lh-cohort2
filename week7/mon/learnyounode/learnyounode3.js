var fs = require('fs');

var file = fs.readFileSync(process.argv[2]);

var str = file.toString();

var split_str = str.split('\n');


console.log((split_str.length) - 1);


