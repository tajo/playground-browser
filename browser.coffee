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
		for key, value of object
			dt = document.createElement 'dt'
			dt.innerHTML = key
			dd = document.createElement 'dd'

			if typeof value is 'object'
				dd.appendChild renderObject(value)
			else
				dd.innerHTML = String(value)

			container.appendChild dt
			container.appendChild dd

		container

	div = document.createElement 'div'
	div.className = 'dump-container'
	definitions = renderObject object
	div.appendChild definitions
	document.body.appendChild div


module.exports.immafakinhacka = () ->
	document.body.style.color = '#0f0'
	document.body.style['font-family'] = 'Menlo'
	document.body.style['background-color'] = '#000'

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


