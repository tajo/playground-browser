module.exports.print = (value) ->
	div = document.createElement 'div'
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
