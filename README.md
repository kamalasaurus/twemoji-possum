# Twemoji Possum 🐭🐭🐭🐭🐭

This started as a javascript parser to merge unicode human-readable
names with twemoji's code-point references in a scalable and repeatable
way for the [twemoji-awesome](http://ellekasai.github.io/twemoji-awesome/) project; however, due to memory leaks in various XML parsers available for node, it became a ruby project 😅

### Build Instructions

`git clone`

`bundle`

`rake`

If you don't have ruby, install via [rbenv](https://github.com/rbenv/rbenv#homebrew-on-mac-os-x).
If you don't have bundler, `gem install bundler` after getting a ruby.

After that, just follow the same three statements in the root (with the
Gemfile) directory of this project.

The rake task will generate an up-to-date mapping of all relevant
entitites.

### Unicode Parse

http://unicode.org/emoji/charts/full-emoji-list.html

Date safety: for some reason, Unicode stores its last update date as
javascript variable, the current build is pulled as of:

- 6/28/2016, 6:16:15 AM

Please use common sense if there's a big update to the emoji table to
check and see if any of the parsing rules break 😃

### Twemoji Parse

https://twemoji.maxcdn.com/2/test/preview.html

Date safety: I don't see an official update stamp for twemoji v2, but
the values were pulled as of:

- 8/10/2016, 1:34:15 AM

### Custom Names Parse

These were pulled from either the twemoji-awesome repo or filled in extensions from
unicode's naming scheme; twemoji-awesome's rules are derived from
emoji-cheat-sheat.  `lib/null_list_rules` are gap-fillers for twitter's
non-standard or cutting edge emoji's that didn't exist in any other
list.

### Author

👳🏾 Kamal R

- email: kamalasaurus@gmail.com
- twitter: [@kamalasaurus](https://twitter.com/kamalasaurus)
- website: [kamalasaurus.github.io](https://kamalasaurus.github.io)

### Contributors

👩🏻 Elle Kasai (creator of twemoji awesome)
- email: elle.kasai@gmail.com
- twitter: [@ellekasai](https://twitter.com/ellekasai)
- website: [ellekasai.com](http://ellekasai.com)

👽 Fake Unicode (mysterious twitter user/genius of unicode documentation)
- twitter: [@FakeUnicode](https://twitter.com/FakeUnicode)
- website: [☃.net](http://☃.net)

👨🏽 Angel Cruz (creator of twemoji awesome npm module)
- email: me@abr4xas.org

### License

- Code: [MIT](https://opensource.org/licenses/MIT)
- Graphics: [CC-BY](https://creativecommons.org/licenses/by/4.0/)

### Acknowledgements

The conversation that prompted this project is hosted on twitter at:
- https://twitter.com/kamalasaurus/status/761504342922842112

What began as minor confusion turned into a fun weekend spike; basically,
assigning human-readable names to all the unicode code-points is kind of
a 🐻

Of course, a huge thanks to Twitter and their amazing in-house designers
for contributing to an open future for the web:
- https://twitter.github.io/twemoji/

### Notes

Other than the list employed, you can see the authoritative published
unicode documentations here:

- http://www.unicode.org/Public/9.0.0/ucd/UnicodeData.txt
- http://www.unicode.org/Public/emoji/3.0//emoji-data.txt
- http://www.unicode.org/Public/emoji/3.0//emoji-zwj-sequences.txt
- http://www.unicode.org/Public/emoji/3.0//emoji-sequences.txt

ZWF Sequence notes such as the pride flag:
- http://www.unicode.org/L2/L2016/16183-rainbow-flag.pdf

Emoji 3.0 Public Spec:
- http://www.unicode.org/Public/emoji/3.0//

It's a bit easier to scrape the emoji-list found at:
- http://unicode.org/emoji/charts/full-emoji-list.html
than to parse and munge overinclusive text files 😅

Since everything is hosted at unicode.org, I'm assuming it'll be
maintained properly ¯\\_(ツ)_/¯

### How to use

I don't want to do anything too fancy with git submodules just yet, for
the time being, just manually copy `dist/emoji_map.scss` into
twemoji-awesome's root directory and run `sass twemoji-awesome.scss`.
Make sure you have sass!  `gem install sass`.
- http://sass-lang.com/documentation/

This will generate a new twemoji-awesome.css.

It's unlikely anyone will be using this repo directly, since it's meant
to just generate a component for twemoji-awesome, the css of which is
what is intended for consumption!  But if you want to contribute by
adding custom names and stuff to the rule list, this is the place to do
it!

### Twemoji Cheat Sheet

The cheat sheet will be maintained at another repo, downstream of
twemoji-awesome.  It will be linked here when it's created!

### Contributing

If I was really awesome, I would have made the `src/CustomMapper.rb`
file iterate through all json's in `lib` and append them to the custom
rules list.  Since I'm not that awesome for v1, just go ahead and make a
json of `"code-point": "custom-name"` or `"code-point": ["custom-names"...]` and have it consumed in `CustomMapper.rb` like all the other custom names.

### TODO

It might be cool to have custom flag names for some of the longer
names.  I'm not sure if I should have the authority to name countries
or something, so I'm preferentially leaving that to the internet.  Refer
to the cheat sheet for obviously unwieldy names.

