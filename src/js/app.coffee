define ['ember', 'jquery', 'markdown', 'db', 'github', 'underscore'], (Ember, $, md, db, Github, _) ->

	makeApplication = ->
		debugger;
		App = Ember.Application.create()

		if BloglessCfg.route is true
			App.Router.map ->
				this.route('blogPost', { path: '*:' });

		class App.CatchAllRoute extends Ember.Route

	return ->
		db.done (server)->

			Github.getFileList(BloglessCfg.username, BloglessCfg.repo).done (data) ->
				runApp = _.after data.length, makeApplication

				for item in data
					for key, prop in item
						delete item.key if _.isObject(prop)
					debugger;
					server.files.add(item).done(runApp)