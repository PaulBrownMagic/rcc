:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1:0:0,
		author is 'Paul Brown',
		date is 2021-12-31,
		comment is 'Unit tests for rcc8'
	]).

	cover(rcc8).

	test(rcc8_exists, true) :-
		current_object(rcc8).

	test(equal, true(Cat == eq)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(5, 5)),
			box(top_left(1, 1), bottom_right(5, 5)),
			Cat).

    test(tpp_left, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(1, 2), bottom_right(5, 5)),
			box(top_left(1, 1), bottom_right(6, 6)),
			Cat).
    test(tpp_top, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(2, 1), bottom_right(5, 5)),
			box(top_left(1, 1), bottom_right(6, 6)),
			Cat).
    test(tpp_right, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(2, 2), bottom_right(5, 5)),
			box(top_left(1, 1), bottom_right(5, 6)),
			Cat).
    test(tpp_bottom, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(2, 2), bottom_right(5, 6)),
			box(top_left(1, 1), bottom_right(6, 6)),
			Cat).
    test(tpp_left_right, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(1, 2), bottom_right(6, 5)),
			box(top_left(1, 1), bottom_right(6, 6)),
			Cat).
    test(tpp_left_right_bottom, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(1, 2), bottom_right(6, 6)),
			box(top_left(1, 1), bottom_right(6, 6)),
			Cat).

    test(tpp_top_bottom_left, true(Cat == tpp)) :-
		rcc8::relation(
			box(top_left(1, 2), bottom_right(6, 6)),
			box(top_left(1, 1), bottom_right(6, 6)),
			Cat).

    test(ec_top, true(Cat == ec)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(3, 3)),
			box(top_left(1, 3), bottom_right(1, 6)),
			Cat).
    test(ec_bottom, true(Cat == ec)) :-
		rcc8::relation(
			box(top_left(1, 3), bottom_right(1, 6)),
			box(top_left(1, 1), bottom_right(3, 3)),
			Cat).
    test(ec_left, true(Cat == ec)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(3, 3)),
			box(top_left(3, 1), bottom_right(6, 3)),
			Cat).
    test(ec_right, true(Cat == ec)) :-
		rcc8::relation(
			box(top_left(3, 1), bottom_right(6, 3)),
			box(top_left(1, 1), bottom_right(3, 3)),
			Cat).

    test(dc_left, true(Cat == dc)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(3, 3)),
			box(top_left(4, 1), bottom_right(7, 3)),
			Cat).
    test(dc_right, true(Cat == dc)) :-
		rcc8::relation(
			box(top_left(4, 1), bottom_right(7, 3)),
			box(top_left(1, 1), bottom_right(3, 3)),
			Cat).
    test(dc_top, true(Cat == dc)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(3, 3)),
			box(top_left(1, 4), bottom_right(3, 7)),
			Cat).
    test(dc_bottom, true(Cat == dc)) :-
		rcc8::relation(
			box(top_left(1, 4), bottom_right(3, 7)),
			box(top_left(1, 1), bottom_right(3, 3)),
			Cat).

    test(po_top, true(Cat == po)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(3, 4)),
			box(top_left(1, 3), bottom_right(3, 6)),
			Cat).
    test(po_bottom, true(Cat == po)) :-
		rcc8::relation(
			box(top_left(1, 3), bottom_right(3, 6)),
			box(top_left(1, 1), bottom_right(3, 4)),
			Cat).
    test(po_left, true(Cat == po)) :-
		rcc8::relation(
			box(top_left(1, 1), bottom_right(4, 3)),
			box(top_left(3, 1), bottom_right(6, 3)),
			Cat).
    test(po_right, true(Cat == po)) :-
		rcc8::relation(
			box(top_left(3, 1), bottom_right(6, 3)),
			box(top_left(1, 1), bottom_right(4, 3)),
			Cat).

:- end_object.
