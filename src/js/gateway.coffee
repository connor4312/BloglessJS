require.config 
	paths:
		jquery: ['//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min', 'jquery'],
		ember: ['//cdnjs.cloudflare.com/ajax/libs/ember.js/1.2.0/ember.min'],
		handlebars: ['//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.2.1/handlebars.min', 'handlebars']

	shim:
		ember:
			deps: ['handlebars']
			exports: 'Ember'
		handlebars:
			exports: 'Handlebars'
		
require ['app'], (App) ->
	App()