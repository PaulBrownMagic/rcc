% Loader for rcc

:- initialization((
	logtalk_load([ % Dependencies
	]),
	logtalk_load([ % Application
		rcc8
	], [
	  % optimize(on)
	])
)).
