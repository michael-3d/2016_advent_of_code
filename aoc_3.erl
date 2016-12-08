-module(aoc_3).
-export([part1/1, part2/1]).

part1(Input) ->
	add(Input, 0).

part2(Input) ->
	add(lists:append(lists:append(shake(Input, [], 1), shake(Input, [], 2)), shake(Input, [], 3)), 0).

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
	 
shake([], New, _) -> New;
shake(Old, New, N) ->
	L1 = e(N, lists:nth(1, Old)),
	L2 = e(N, lists:nth(2, Old)),
	L3 = e(N, lists:nth(3, Old)),
	shake(lists:sublist(Old, 4, length(Old)), [{L1, L2, L3} | New], N).

e(N, T) ->
	element(N, T).