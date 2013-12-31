require.config 
	paths:
		jquery: ['//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min', 'lib/jquery']
		underscore: ['//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min', 'lib/underscore']
		ember: ['//cdnjs.cloudflare.com/ajax/libs/ember.js/1.2.0/ember.min']
		handlebars: ['//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.2.1/handlebars.min', 'lib/handlebars']
		markdown: ['lib/markdown'],
		dbdotjs: ['lib/db']

	shim:
		underscore:
			exports: '_'
		ember:
			deps: ['handlebars']
			exports: 'Ember'
		handlebars:
			exports: 'Handlebars'
		markdown:
			exports: 'markdown'
		db:
			exports: 'db'
		
require ['app'], (App) ->
	App()