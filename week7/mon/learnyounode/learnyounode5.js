var fs = require('fs');
path = require('path');
fs.readdir(process.argv[2], function callback(err, data) {
  if (err) {
    console.log(err)
  } else {
      data.forEach(function(entry) {
        if (path.extname(entry) === ("." + process.argv[3])){
          console.log(entry)
        }
      })
  }
})

