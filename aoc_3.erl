-module(aoc_3).
-export([part1/1]).

part1(Input) ->
	add(Input, 0).

add([], C) -> C;
add([I | Input], C) ->
	add(Input, C + validate(I)).

validate(T) ->
	E = list_to_tuple(lists:sort(tuple_to_list(T))),
	B = (e(1, E) + e(2, E)) > e(3, E),
	if
		B == true ->
			1;
		true ->
			0
	end.
	 
	

e(N, T) ->
	element(N, T).