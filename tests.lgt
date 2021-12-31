:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1:0:0,
		author is 'Paul Brown',
		date is 2021-12-31,
		comment is 'Unit tests for rcc'
	]).

	cover(rcc).

	test(rcc_exists, true) :-
		current_object(rcc).

:- end_object.
