-module(aoc_2).
-export([part1/1]).
-export([n1/1, n2/1, n3/1, n4/1, n5/1, n6/1, n7/1, n8/1, n9/1]).

% {U, D, L, R}
n1(Xs) -> call({n1, n4, n1, n2}, Xs, "1").	
n2(Xs) -> call({n2, n5, n1, n3}, Xs, "2").	
n3(Xs) -> call({n3, n6, n2, n3}, Xs, "3").	
n4(Xs) -> call({n1, n7, n4, n5}, Xs, "4").	
n5(Xs) -> call({n2, n8, n4, n6}, Xs, "5").	
n6(Xs) -> call({n3, n9, n5, n6}, Xs, "6").	
n7(Xs) -> call({n4, n7, n7, n8}, Xs, "7").	
n8(Xs) -> call({n5, n8, n7, n9}, Xs, "8").	
n9(Xs) -> call({n6, n9, n8, n9}, Xs, "9").	

call(_, [], Calling) -> Calling;
call(Config, [X | Xs], _) ->
	% io:format("~s~n", [Calling]),
	apply(?MODULE, element(X, Config), [Xs]).
part1(_) -> [].