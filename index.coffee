b = require './browser' #some handy output functions
Example = require './example' #just an example

b.h1 'Playgroung'

b.h2 'Docs'

b.print 'There are many cool commands in browser.coffee module'

b.h3 '#h1 (value)'
b.print 'Renders <h1> containing desired value passed through only argument'

b.h3 '#h2 (value)'
b.print 'Renders <h2> containing desired value passed through only argument'

b.h3 '#h3 (value)'
b.print 'Renders <h3> containing desired value passed through only argument'

b.h3 '#print (value, escaped = true)'
b.print 'Prints value to the output and escape HTML tags'

b.h3 '#reset'
b.print 'Clean the page'

b.h3 '#image (src)'
b.print 'Add image from src to the page'

b.h3 '#list (list)'
b.print 'Renders unordered list, accepts list as only argument'

b.h3 '#hr'
b.print 'Renders horizontal line'

b.h3 '#table (matrix)'
b.print 'Renders table, accepts matrix as only argument'

b.h3 '#code (value, escaped = true)'
b.print 'Renders code block (escaped)'

b.h2 'Examples'

b.print 'Hai hacker! You are all set to rock!'
do b.hr

# Example class usage
example = new Example
example.setFoo 'some output'
b.print example.getFoo()

# Example of table
b.table [
	['January', 'February', 'March']
	['April', 'May', 'June']
	['July', 'August', 'September']
]

b.code "b.table [\n
  \t['January', 'February', 'March']\n
  \t['April', 'May', 'June']\n
  \t['July', 'August', 'September']\n
]\n
"


b.list ['January', 'February', 'March']

b.image "http://quicklol.com/wp-content/uploads/2012/03/omg-bacon-funny-cat.jpg"