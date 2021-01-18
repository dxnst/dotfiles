require('vis')

vis.events.subscribe(vis.events.INIT, function ()
	vis:command ('set theme base16-nord')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function (win)
	vis:command ('set colorcolumn 80')
	vis:command ('set ai')
	vis:command ('set tw 8')
	vis:command ('set show-tabs')
end)
