var fs = require('fs');

fs.readFile(process.argv[2], 'utf8', function callback(err, data) {
  if (err) {
    console.log(err)
  } else {
    var split_str = data.split('\n');
    console.log(split_str.length - 1)
  }
})



