b = require './browser' #some handy output functions
Example = require './example' #just an example


b.print 'Hai hacker! You are all set to rock!'
do b.hr

# Example class usage
example = new Example
example.setFoo 'some output'
b.print example.getFoo()

# Example of table
table =
	[
		['January', 'February', 'March']
		['April', 'May', 'June']
		['July', 'August', 'September']
	]

b.table table

b.h1 'Headline 1'
b.h2 'Headline 2'
b.h3 'Headline 3'

list = ['January', 'February', 'March']
b.list list