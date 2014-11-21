markdown = require( "markdown" ).markdown

module.exports.escapeHtml = (html = '') ->
	map =
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  html.replace /[&<>"']/g, (m) ->
  		map[m]

module.exports.getParameters = () ->
	query = window.location.search.substring 1
	vars = query.split "&"

	result = {}
	for i in [0..vars.length-1]
		pair = vars[i].split '='

		result[pair[0]] = pair[1]

	result

module.exports.dumpObject = (object) ->
	renderObject = (object) ->
		container = document.createElement 'dl'

		if typeof object is 'number' or typeof object is 'string'
			dt = document.createElement 'dt'
			dt.innerHTML = String object
			container.appendChild dt
		else
			for key, value of object
				dt = document.createElement 'dt'
				dt.innerHTML = key
				dd = document.createElement 'dd'

				if Array.isArray value
					for item in value
						dd.appendChild renderObject item
				else if typeof value is 'object'
					dd.appendChild renderObject(value)
				else
					dd.innerHTML = String value

				container.appendChild dt
				container.appendChild dd

		container

	div = document.createElement 'div'
	div.className = 'dump-container'
	definitions = renderObject object
	div.appendChild definitions
	document.body.appendChild div

module.exports.space = () ->
	div = document.createElement 'div'
	div.style.height = '30px'
	document.body.appendChild div

module.exports.input = (title, onsubmit, helpText = '') ->
	throw new Error 'onSubmit is not a function' unless typeof onsubmit is 'function'

	div = document.createElement 'div'
	div.className = 'help-container'
	input = document.createElement 'input'
	input.style['width'] = '30%'
	input.style['padding'] = '5px'
	input.style['margin-right'] = '20px'
	input.setAttribute 'type', 'text'
	input.setAttribute 'placeholder', title

	button = document.createElement 'button'
	button.addEventListener 'click', (e) ->
		onsubmit input.value
	button.innerHTML = 'Submit'

	help = document.createElement 'span'
	help.className = 'help-text'
	help.innerHTML = module.exports.escapeHtml helpText

	div.appendChild input
	div.appendChild button
	div.appendChild help
	document.body.appendChild div

module.exports.print = (value, escaped = true) ->
	div = document.createElement 'div'
	value = module.exports.escapeHtml value if escaped
	div.innerHTML = value
	document.body.appendChild div

module.exports.code = (value, escaped = true) ->
	div = document.createElement 'pre'
	value = module.exports.escapeHtml value if escaped
	div.innerHTML = value
	document.body.appendChild div

module.exports.reset = ->
	document.body.innerHTML = ''

module.exports.h1 = (value) ->
	h1 = document.createElement 'h1'
	h1.innerHTML = value
	document.body.appendChild h1

module.exports.h2 = (value) ->
	h2 = document.createElement 'h2'
	h2.innerHTML = value
	document.body.appendChild h2

module.exports.h3 = (value) ->
	h3 = document.createElement 'h3'
	h3.innerHTML = value
	document.body.appendChild h3

module.exports.image = (src) ->
	img = document.createElement 'img'
	img.setAttribute 'src', src
	document.body.appendChild img

module.exports.list = (list) ->
	ul = document.createElement 'ul'
	for i in [0..list.length-1]
		li = document.createElement 'li'
		li.appendChild document.createTextNode list[i]
		ul.appendChild li
	document.body.appendChild ul

module.exports.hr = ->
	document.body.appendChild document.createElement 'hr'

module.exports.button = (title, onclick, helpText = '') ->
	throw new Error 'onClick is not a function' unless typeof onclick is 'function'

	div = document.createElement 'div'
	div.className = 'help-container'
	button = document.createElement 'button'
	button.addEventListener 'click', onclick
	button.innerHTML = title
	help = document.createElement 'span'
	help.className = 'help-text'
	help.innerHTML = module.exports.escapeHtml helpText
	div.appendChild button
	div.appendChild help
	document.body.appendChild div

module.exports.table = (matrix) ->
	tbl = document.createElement 'table'
	tbdy = document.createElement 'tbody'
	for i in [0..matrix.length-1]
		tr = document.createElement 'tr'
		row = matrix[i];
		for j in [0..row.length-1]
			td = document.createElement 'td'
			td.appendChild document.createTextNode row[j]
			tr.appendChild td
		tbdy.appendChild tr
	tbl.appendChild tbdy
	document.body.appendChild tbl

module.exports.file = (callback) ->
	throw new Error 'Callback is not a function' unless typeof callback is 'function'
	input = document.createElement 'input'
	input.setAttribute 'type', 'file'
	input.setAttribute 'multiple', true
	input.addEventListener('change', ((e) ->
			files = e.target.files

			callback files
		), false);
	document.body.appendChild input

module.exports.progress = class Progress
	constructor: (@max, @color = '#00f', @description = 'is finished.') ->
		@element = document.createElement 'div'
		@bar = document.createElement 'div'
		@bar.className = 'progress-bar'
		@caption = document.createElement 'div'

		document.body.appendChild @element
		@element.appendChild @bar
		@element.appendChild @caption
		@update 0

	update: (@value) ->
		@caption.innerHTML = @value + ' / ' + @max + ' ' + @description
		@bar.style.width = "#{(@value / @max) * 100}%"
		@bar.style['background-color'] = @color

	getValue: -> @value

module.exports.barchart = (data, options = null) ->
	canvas = document.createElement 'canvas'
	canvas.id = module.exports.guid()
	canvas.width  = 600
	canvas.height = 400
	document.body.appendChild canvas
	if !options
		options = {
			scaleFontSize: 14
			scaleFontFamily: 'Arial'
			animationSteps: 200
			scaleLineColor: "rgba(0,0,0,.4)"
		}
	new Chart(canvas.getContext("2d")).Bar(data, options)

module.exports.linechart = (data, options = null) ->
	canvas = document.createElement 'canvas'
	canvas.id = module.exports.guid()
	canvas.width  = 800
	canvas.height = 400
	document.body.appendChild canvas
	if !options
		options = {
			scaleFontSize: 14
			scaleFontFamily: 'Arial'
			bezierCurve : false
		}
	new Chart(canvas.getContext("2d")).Line(data, options)

module.exports.chartlabel = (names, colors) ->
	div = document.createElement 'div'
	div.style.width = '200px'
	div.style.float = 'left'
	div.style.marginTop = '25px'
	for name, key in names
		innerDiv = document.createElement 'div'
		innerDiv.style.padding = '3px'
		innerDiv.style.margin = '2px'
		innerDiv.style.color = 'white'
		innerDiv.style.backgroundColor = 'rgb(' + colors[key] + ')'
		innerDiv.innerHTML = name
		div.appendChild innerDiv
	document.body.appendChild div
	return div

module.exports.guid = -> 'guid' + Date.now()

module.exports.md = (value) ->
	div = document.createElement 'div'
	div.innerHTML = markdown.toHTML value
	div.className = 'markdown'
	document.body.appendChild div
	return div


