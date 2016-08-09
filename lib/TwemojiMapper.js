var fs = require('fs');
var path = require('path');
var jsdom = require('jsdom');

var OUTPUT_PATH = path.join(__dirname, '..', 'tmp', 'twemoji_list.csv');

console.log('starting scrape');

jsdom.env({
  url: 'https://twemoji.maxcdn.com/2/test/preview.html',
  scripts: ['http://code.jquery.com/jquery.js'],
  FetchExternalResources: ['script'],
  ProcessExternalResources: ['script'],
  MutationEvents: '2.0',
  done: function(error, window) {

    $ = window.$;

    console.log($('li img').toArray());

    setTimeout(function() {
      var output = Array
        .prototype
        .slice
        .call(window.document.querySelectorAll('li img'))
        .map(function(el) {
          return el
            .src
            .split('/')
            .slice(-1)[0]
            .split('.')[0];
        })
        .join(/\n/);
      fs.writeFileSync(OUTPUT_PATH, output);
    }, 15000);
  }
});

