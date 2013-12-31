define ['jquery'], ($) ->

	class Github

		constructor: ->
			@apiUrl = 'https://api.github.com/'

		getUser: (username) ->
			return $.ajax({
				url: @apiUrl + 'users/' + username,
				type: 'GET'
				dataType: 'json'
			})

		getFileList: (username, repo, path = '/') ->
			return $.ajax({
				url: @apiUrl + 'repos/' + username + '/' + repo + '/contents' + path
				type: 'GET'
				dataType: 'json'
			})

		getFileContents: (username, repo, path = '/', callback) ->
			$.ajax({
				url: @apiUrl + 'repos/' + username + '/' + repo + '/contents' + path
				type: 'GET'
				dataType: 'text'
				headers: 
					Accept: 'application/vnd.github.VERSION.raw'
			})

	return new Github()