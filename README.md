# RCC: Regional Connection Calculus (Randell, Cui, & Cohn)

A Calculus for spatial reasoning.

## RCC8

Has 8 relations. Send the `rcc8` object a `relation` message with 2 boxes and
it'll tell you the relation:

```prolog
?- rcc8::relation(
	box(top_left(1, 1), bottom_right(3, 3)),
	box(top_left(1, 7), bottom_right(3, 9)),
	Relation),
	rcc8::label(Relation, Label).
Relation = dc,
Label = disconnected.
```
