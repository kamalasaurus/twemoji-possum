/***************************************************************************
* TWEMOJI POSSUM 🐭🐭🐭🐭
* --github url goes here--
*
* AUTHOR:
*
* 👳🏾 Kamal R
* email: kamalasaurus@gmail.com
* twitter: @kamalasaurus
* website: kamalasaurus.github.io
*
* CONTRIBUTORS:
*
* 👩🏻 Elle Kasai (creator of twemoji awesome)
* email: elle.kasai@gmail.com
* twitter: @ellekasai
* website: ellekasai.com
*
* 👽 Fake Unicode (mysterious twitter user/genius of unicode documentation)
* twitter: @FakeUnicode
* website: ☃.net
*
* 👨🏽 Angel Cruz (creator of twemoji awesome npm module)
* email: me@abr4xas.org
* website: abr4sas.org
*
* The conversation that prompted this project is hosted on twitter at:
* https://twitter.com/kamalasaurus/status/761504342922842112
*
* What began as minor confusion turned into a fun weekend spike; basically,
* assigning human-readable names to all the unicode code-points is kind of
* a 🐻
*
* ACKNOWLEDGEMENTS:
*
* Of course, a huge thanks to Twitter and their amazing in-house designers
* for contributing to an open future for the web
* https://twitter.github.io/twemoji/
*
* WHY IS THIS IN RUBY:
*
* Because JSDOM and Cheerio both choked to death trying to load the html
* for the Full Emoji List!  I'm amazed that a 30 MB html file could
* completely destroy both of those projects with a Stack Allocation Error!
* I'm only trying to deal with one open source problem at a time, so I'll
* leave fixing those projects to the next guy 😅
*
* NOTES:
*
* Make sure to read the README.md to see how to build the project!
*
* Other than the list employed, you can see the authoritative published
* unicode documentations here:
*
* http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt
* http://www.unicode.org/Public/emoji/3.0//emoji-zwj-sequences.txt
* http://www.unicode.org/Public/emoji/3.0//emoji-sequences.txt
*
* It's a bit easier to scrape the emoji-list found at:
* http://unicode.org/emoji/charts/full-emoji-list.html
* than to parse and munge overinclusive text files 😅
*
* Since everything is hosted at unicode.org, I'm assuming it'll be
* maintained properly ¯\_(ツ)_/¯
***************************************************************************/

/***************************************************************************
* DEPENDENCIES: libraries used by this script
***************************************************************************/

var fs = require('fs');
var path = require('path');

var wget = require('wget');
var jsdom = require('jsdom');



/***************************************************************************
* URLS: all the external urls that are scraped or downloaded are declared up
* top for easy maintenance, search for the variable name (e.g. UNICODE_URL)
* to find where they are used in the script 👍
***************************************************************************/

var UNICODE_URL= 'http://unicode.org/emoji/charts/full-emoji-list.html';
var TWEMOJI_URL = 'https://github.com/twitter/twemoji/tree/gh-pages/svg';



/***************************************************************************
* PROMISE BODIES: these are the async promise bodies for the promises of the
* same name
****************************************************************************/

function _getUnicode() {

  jsdom.env({
    url: 'http://unicode.org/emoji/charts/full-emoji-list.html',
    scripts: ['http://code.jquery.com/jquery.js'],
    done: function(err, window) {
      if (err) {
        console.eror(err);
        return;
      }
      console.log('hello');
      return;
    }
  })

}

_getUnicode();

// these are the base unicode entries found at UNICODE_URL:
// http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt
//function _getUnicode(resolve, reject) {

  //jsdom.env({
    //url: (UNICODE_URL),
    //scripts: ["http://code.jquery.com/jquery.js"],
    //done: function(errors, window) {
      //if (errors) {
        //reject(errors);
        //return;
      //}

      //console.log('hello');


      //var $ = window.$;

      //var keyMap = {};

      //var unicodeEntries = $('tr').filter(function(i, el) {
        //// there's a header line every few rows
        //return $(el).find('th').length === 0;
      //});

      //unicodeEntries.forEach(function(i, el) {
        //$el = $(el);
        //var code = $el.find('td.code').attr('name');
        //var name = $el.find('td.name')
          //.text()
          //.toLowerCase()
          //.trim()
          //.replace(/\w/g, ' ')
          //.split(' ')
          //.join('-');
        //console.log(code, name);
        //keyMap[code] = name;
      //});

      //resolve(keyMap);
      //return;
    //}
  //});

//}

// these are the base unicode entries found at UNICODE_URL:
// http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt
//function _getUnicode(resolve, reject) {
  //var unicodeSrc = 'http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt';
  //var unicodeOut = path.join(__dirname, 'unicodeList.txt');

  //var download = wget.download(unicodeSrc, unicodeOut);
  //download.on('end', function(filePath) {
    //var unicodeList = convertFileToList(filePath);
    //var unicodeMap = unicodeList.reduce(unicodeKeyMapper, {});
    //resolve(unicodeMap);
    //return;
  //});
  //download.on('error', function(error) {
    //reject(error);
    //return;
  //});
//}

// these are the code-points currently supported by twemoji in svg format found at TWEMOJI_URL:
// https://github.com/twitter/twemoji/tree/gh-pages/svg
//function _getTwemoji(resolve, reject) {

  //jsdom.env({
    //url: ('https://github.com/twitter/twemoji/tree/gh-pages/svg'),
    //scripts: ["http://code.jquery.com/jquery.js"],
    //done: function(errors, window) {
      //if (errors) { console.error(errors); }

      //var $ = window.$;
      //var txt = $('pre').text();

      //var codePoints = $('td.content a').toArray()

    //}
  //});

//}



/***************************************************************************
* PROMISES: these are the promises generated from the asynchronous file-
* reads and scrapes declared in the PROMISE BODIES section
***************************************************************************/

// a key map of all base unicode sequences listedby the unicode consortium
//var getUnicode = new Promise(_getUnicode);
//var getTwemoji = new Promise(_getTwemoji);

//Promise.all([getUnicode]).then(function(values) {
  //console.log(values);
  //console.log('end');
//}, function(errors) {
  //console.error(errors);
//});


//Promise.all([getUnicode, getModifieds, getZWJs, getTwemojis]).then(function(values) {

//}, function(error) {
  //console.error(error);
//});

//function writeFile(obj) {
  //fs.writeFileSync('unicodeList.txt', txt);
//}

