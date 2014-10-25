module.exports.print = (value) ->
	div = document.createElement 'div'
	div.innerHTML = value
	document.body.appendChild div

module.exports.reset = ->
	document.body.innerHTML = ''

module.exports.hr = ->
	document.body.appendChild document.createElement 'hr'