var fs = require('fs');
var path = require('path');

var wget = require('wget');
//var jsdom = require('jsdom');
var src = 'http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt';
var out = path.join(__dirname, 'unicodeList.txt');

var download = wget.download(src, out);

download.on('end', processUnicode);

function processUnicode(filePath) {
  var unicodeList = fs.readFileSync(filePath)
                      .toString()
                      .split(/\n/g);
  console.log(unicodeList);
}


//function getUnicodeList() {

  //jsdom.env({
    //url: (url),
    //scripts: ["http://code.jquery.com/jquery.js"],
    //done: function(errors, window) {
      //if (errors) { console.error(errors); }

      //var $ = window.$;
      //var txt = $('pre').text();

      //writeFile(txt);
    //}
  //});

//}

//function writeFile(obj) {
  //fs.writeFileSync('unicodeList.txt', txt);
//}

//getUnicodeList();
