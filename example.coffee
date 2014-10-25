module.exports = class Example
	constructor: () -> @foo = 'default'
	setFoo: (@foo) ->
	getFoo: -> @foo
