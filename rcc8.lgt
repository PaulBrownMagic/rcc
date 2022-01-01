:- object(rcc8).

	:- info([
		version is 0:1:0,
		author is 'Paul Brown',
		date is 2021-12-31,
		comment is 'rcc'
	]).

	:- public(label/2).
	:- mode(label(+atom, -atom), zero_or_one).
	:- mode(label(?atom, ?atom), zero_or_more).
	:- info(label/2, [
	   comment is 'Human-readable label for the RCC8 relations',
	   argnames is ['Relation', 'Label']
	]).
	label(dc, disconnected).
	label(ec, 'externally connected').
	label(eq, equal).
	label(po, 'partially overlapping').
	label(tpp, 'tangential proper part').
	label(nttp, 'non-tangential proper part').
	label('tpp-', 'tangential proper part inverse').
	label('nttp-', 'non-tangential proper part inverse').

	:- public(relation/3).
	:- mode(relation(+compound, +compound, -atom), one).
	:- info(relation/3, [
	   	comment is 'RCC8 relation between the two region describing terms',
		argnames is ['Region1', 'Region2', 'RCC8relation']
	]).
	relation(
		box(top_left(X1, Y1), bottom_right(X2, Y2)),
		box(top_left(X3, Y3), bottom_right(X4, Y4)),
		Relation
	) :-
	  once((
		compare(Left, X1, X3),
		compare(Top, Y1, Y3),
		compare(Right, X2, X4),
		compare(Bottom, Y2, Y4),
		containing_category(Left, Top, Right, Bottom, Relation)
		;
		compare(LeftRight, X1, X4),
		compare(RightLeft, X2, X3),
		compare(TopBottom, Y1, Y4),
		compare(BottomTop, Y2, Y3),
		noncontaining_category(LeftRight, RightLeft, TopBottom, BottomTop, Relation)
		)).

    containing_category((=), (=), (=), (=), eq).
    containing_category((>), (>), (<), (<), ntpp).
    containing_category((=), (>), (<), (<), tpp).
    containing_category((>), (=), (<), (<), tpp).
    containing_category((>), (>), (=), (<), tpp).
    containing_category((>), (>), (<), (=), tpp).
    containing_category((=), (=), (<), (<), tpp).
    containing_category((=), (>), (=), (<), tpp).
    containing_category((=), (>), (<), (=), tpp).
    containing_category((=), (=), (=), (<), tpp).
    containing_category((=), (=), (<), (=), tpp).
    containing_category((=), (>), (=), (=), tpp).
    containing_category((>), (=), (=), (<), tpp).
    containing_category((>), (=), (<), (=), tpp).
    containing_category((>), (=), (=), (=), tpp).
    containing_category((>), (>), (=), (<), tpp).
    containing_category((>), (>), (=), (=), tpp).
    containing_category((<), (<), (>), (>), 'ntpp-').
    containing_category((=), (<), (>), (>), 'tpp-').
    containing_category((<), (=), (>), (>), 'tpp-').
    containing_category((<), (<), (=), (>), 'tpp-').
    containing_category((<), (<), (>), (=), 'tpp-').
    containing_category((=), (=), (>), (>), 'tpp-').
    containing_category((=), (<), (=), (>), 'tpp-').
    containing_category((=), (<), (>), (=), 'tpp-').
    containing_category((=), (=), (=), (>), 'tpp-').
    containing_category((=), (=), (>), (=), 'tpp-').
    containing_category((=), (<), (=), (=), 'tpp-').
    containing_category((<), (=), (=), (>), 'tpp-').
    containing_category((<), (=), (>), (=), 'tpp-').
    containing_category((<), (=), (=), (=), 'tpp-').
    containing_category((<), (<), (=), (>), 'tpp-').
    containing_category((<), (<), (=), (=), 'tpp-').

	noncontaining_category((=), (>),   _,   _, ec).
	noncontaining_category((<), (=),   _,   _, ec).
	noncontaining_category(  _,   _, (=), (>), ec).
	noncontaining_category(  _,   _, (<), (=), ec).
	noncontaining_category((<), (<),   _,   _, dc).
	noncontaining_category((>), (>),   _,   _, dc).
	noncontaining_category(  _,   _, (<), (<), dc).
	noncontaining_category(  _,   _, (>), (>), dc).
	noncontaining_category(  _,   _, (<), (>), po).
	noncontaining_category((<), (>),   _,   _, po).

:- end_object.
