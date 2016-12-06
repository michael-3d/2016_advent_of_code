-module(aoc_1).
-export([part1/1, part2/1]).

part1(Input) ->
	R = main(0, 0, 0, Input, []),
	abs(e(2, R)) + abs(e(3, R)).

part2(Input) ->
	R = main(0, 0, 0, Input, []),
	e(4, R).

main(F, X, Y, [], Route) ->
	{F, X, Y, Route};
main(F, X, Y, [V | Vs], Route) ->
	F2 = changeDir(F, decode(1, V)),
	R = move(F2, X, Y, decode(2, V), Route),
	X2 = e(1, R),
	Y2 = e(2, R),
	Route2 = e(3, R),
	main(F2, X2, Y2, Vs, Route2).

decode(N, [D | Dist]) ->
	e(N, {D, list_to_integer(Dist)}).

changeDir(F, D) ->
	if
		D == 76 ->
			if
				F == 0 ->
					3;
				true ->
				(F - 1) rem 4
			end;
		D == 82 ->
			(F + 1) rem 4;
		true ->  io:fwrite("ERROR 1 (~w)~n", [D])
	end.

move(F, X, Y, 0, Route) ->
	{X, Y, Route};
move(F, X, Y, Dist, Route) ->
	S = step(F, X, Y),
	X2 = e(1, S),
	Y2 = e(2, S),
	routeCheck({X2, Y2}, Route),
	move(F, X2, Y2, Dist-1, [S | Route]).
step(F, X, Y) ->
	case F of
		0 ->
			north(X, Y);
		1 ->
			east(X, Y);
		2 ->
			south(X, Y);
		3 ->
			west(X, Y)
	end.

north(X, Y) ->
	% debug("north ", X, Y, Dist),
	{X, Y+1}. 
east(X, Y) ->
	% debug("east  ", X, Y, Dist),
	{X+1, Y}. 
south(X, Y) ->
	% debug("south ", X, Y, Dist),
	{X, Y-1}. 
west(X, Y) ->
	% debug("west  ", X, Y, Dist),
	{X-1, Y}.

debug(D, X, Y, Dist) ->
	io:fwrite("~s:~w:~w:~w~n", [D,Dist,X,Y]).

e(N, T) ->
	element(N, T).

routeCheck(_, []) -> 
	[];
routeCheck(Cur, [R | Rs]) ->
	if
		Cur == R ->
			io:fwrite("intersection: ~w~n", [abs(e(1, Cur)) + abs(e(2, Cur))]);
		true ->
			routeCheck(Cur, Rs)
			% io:fwrite("not: ~w:~w~n", [Cur, R])
	end.
