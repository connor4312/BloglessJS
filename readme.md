#Blogless
This is a personal project - a blog with no backend! It takes a public git repo full of markdown files, then parses them and sets up a blog application, completely on the client side. It's quite simple to set up: include the script in your page, set the configs, and you're ready to go. It can even be embedded in specific elements of the page, meaning you can put a Blogless blog wherever you'd like.

##Stack
Blogless is built in Coffeescript, and makes use of:

 * Require.js
 * [db.js](https://github.com/aaronpowell/db.js) for local storage of data.
 * [Ember.js](https://github.com/emberjs/ember.js) for applicationy stuff.
 * The Github API

##FAQ

**Q**: Why would anyone use this?

**A**: This could be used in systems where you don't have access to a backend or database. Or it could simply be used on sites where a blog is needed, and you don't want to spend a lot of time setting one up.

**Q**: How good is the SEO?

**A**: Nonexistent. This is a very specific application, built more for academic purposes than anything else.

**Q**: Load times?

**A**: The blog takes a few seconds to load initially, as it brings in required scripts and such. Afterwards, it's quite snappy.

##License
MIT license. Do what you want, don't sue me.

##Contributing
Submit PRs, write code that doesn't kill too many babies.