-module(aoc_1).
-export([main/4]).

main(_, X, Y, []) ->
	abs(X)+abs(Y);
main(F, X, Y, [V | Vs]) ->
	F2 = changeDir(F, decode(1, V)),
	R = move(F2, X, Y, decode(2, V)),
	main(F2, e(1, R), e(2, R), Vs).

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

move(F, X, Y, Dist) ->
	case F of
		0 ->
			north(X, Y, Dist);
		1 ->
			east(X, Y, Dist);
		2 ->
			south(X, Y, Dist);
		3 ->
			west(X, Y, Dist)
	end.

north(X, Y, Dist) ->
	debug("north ", X, Y, Dist),
	{X, Y+Dist}. 
east(X, Y, Dist) ->
	debug("east  ", X, Y, Dist),
	{X+Dist, Y}. 
south(X, Y, Dist) ->
	debug("south ", X, Y, Dist),
	{X, Y-Dist}. 
west(X, Y, Dist) ->
	debug("west  ", X, Y, Dist),
	{X-Dist, Y}.

debug(D, X, Y, Dist) ->
	io:fwrite("~s:~w:~w:~w~n", [D,Dist,X,Y]).

e(N, T) ->
	element(N, T).