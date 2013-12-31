define ['ember', 'jquery', 'markdown', 'db', 'github', 'underscore'], (Ember, $, md, db, Github, _) ->


	class Blogless

		@server = undefined

		makeApplication: ->
			debugger;
			App = Ember.Application.create()

			if BloglessCfg.route is true
				App.Router.map ->
					this.route('blogPost', { path: '*:' });

		loadData: ->
			Github.getFileList(BloglessCfg.username, BloglessCfg.repo).done (data) =>
				runApp = _.after data.length, @makeApplication

				@insertFile(item, runApp) for item in data

		insertFile: (item, callback)->
			@server.files.query().only('sha', item.sha).execute().done (out) =>
				return false if out.length

				finish = _.after 2, callback

				Github.getFileContents(BloglessCfg.username, BloglessCfg.repo, item.path).done (output) =>
					@addPost item.sha, output, finish

				@server.files.add(item).done(finish)


		addPost: (sha, input, callback) =>
			# Should probably be ported over to a lexer at some point (regexp)
			# is evil for HTMLish stuff.
			metadata = input.match(/(<!--BLOGLESS)(\s+)*(\{[\S\s]+?\})(\s+)(-->)/)[3]

			data = JSON.parse metadata
			data.contents = input
			data.sha = sha

			@server.posts.add(data).done(callback)


	return ->
		blog = new Blogless()
		db.done (server)->
			blog.server = server
			blog.loadData()