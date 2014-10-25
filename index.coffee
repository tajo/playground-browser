b = require './browser' #some handy output functions
Example = require './example' #just an example


b.print 'Hai hacker! You are all set to rock!'
do b.hr

# Example class usage
example = new Example
example.setFoo 'some output'
b.print example.getFoo()
