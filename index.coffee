b = require './browser' #some handy output functions
Example = require './example' #just an example

b.h1 'Playground'

b.h2 'Documentation'

b.print 'There are many cool commands in the browser.coffee module'

b.h3 '#h1 (value)'
b.print 'Renders <h1> containing a desired value passed through the only argument'

b.h3 '#h2 (value)'
b.print 'Renders <h2> containing a desired value passed through the only argument'

b.h3 '#h3 (value)'
b.print 'Renders <h3> containing a desired value passed through the only argument'

b.h3 '#print (value, escaped = true)'
b.print 'Prints a value to the output and escape HTML tags'

b.h3 '#reset'
b.print 'Clean the page'

b.h3 '#image (src)'
b.print 'Add an image from src to the page'

b.h3 '#list (list)'
b.print 'Renders the unordered list, accepts a list as only argument'

b.h3 '#hr'
b.print 'Renders a horizontal line'

b.h3 '#table (matrix)'
b.print 'Renders a table, accepts a matrix as only argument'

b.h3 '#code (value, escaped = true)'
b.print 'Renders a code block (escaped)'

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
	['October', 'November', 'December']
]

b.code "b.table [\n
  \t['January', 'February', 'March']\n
  \t['April', 'May', 'June']\n
  \t['July', 'August', 'September']\n
  \t['October', 'November', 'December']\n
]\n
"

b.list ['January', 'February', 'March']

progress = new b.progress 1000
(someHeavyTask = (i) ->
   setTimeout ->
      progress.update 1000-i
      someHeavyTask i if --i+1
   , 300
) 1000

b.image "http://quicklol.com/wp-content/uploads/2012/03/omg-bacon-funny-cat.jpg"