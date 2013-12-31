define ['ember', 'jquery', 'markdown', 'db', 'github', 'underscore'], (Ember, $, md, db, Github, _) ->


	class Blogless

		@server = undefined

		makeApplication: ->
			debugger;
			App = Ember.Application.create()

			if BloglessCfg.route is true
				App.Router.map ->
					this.route('blogPost', { path: '*:' });

		addFiles: ->
			Github.getFileList(BloglessCfg.username, BloglessCfg.repo).done (data) =>
				runApp = _.after data.length, @makeApplication

				for item in data
					@server.files.query().only('sha', item.sha).execute().done (out) =>
						debugger;
						return false if out.length

						Github.getFileContents(BloglessCfg.username, BloglessCfg.repo, item.path).done @addPost

						@server.files.add(item).done(runApp)

		addPost: (input) =>
			# Should probably be ported over to a lexer at some point (regexp)
			# is evil for HTMLish stuff.
			metadata = input.match(/(<!--BLOGLESS)(\s+)*(\{[\S\s]+?\})(\s+)(-->)/)[3]

			data = JSON.parse metadata
			data.contents = input

			@server.posts.add data


	return ->
		blog = new Blogless()
		db.done (server)->
			blog.server = server
			blog.addFiles()