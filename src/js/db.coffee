define ['dbdotjs'], (db) ->
	return db.open({
		server: 'Blogless'
		version: 1
		schema:
			posts:
				key:
					keyPath: 'id' 
					autoIncrement: true
				indexes:
					sha:
						unique: true
			files:
				key:
					keyPath: 'id' 
					autoIncrement: true
				indexes:
					sha:
						unique: true
	})