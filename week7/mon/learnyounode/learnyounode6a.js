var fs = require('fs');
path = require('path');

module.exports = function (dir, filterStr, callBack) {
  
  fs.readdir(dir, function(error, files) {
    if (error) {
      callBack(error);
    } else {
      var result = [];
      files.forEach(function(entry) {
        if (path.extname(entry) === ("." + filterStr )) {
          // console.log('in here');
          result.push(entry);
        }
      });
      callBack(null, result);
    }
  });
};
