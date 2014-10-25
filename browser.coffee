module.exports.print = (value) ->
	div = document.createElement 'div'
	div.innerHTML = value
	document.body.appendChild div

module.exports.reset = ->
	document.body.innerHTML = ''

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
