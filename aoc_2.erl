-module(aoc_2).
-export([main/2]).
-export([n1/1, n2/1, n3/1, n4/1, n5/1, n6/1, n7/1, n8/1, n9/1]).
-export([f1/1, f2/1, f3/1, f4/1, f5/1, f6/1, f7/1, f8/1, f9/1, fA/1, fB/1, fC/1, fD/1]).

main(_, []) -> []; 
main(Start, [I | Is]) -> 
	R = apply(?MODULE, Start, [convert(I)]),
	[R | main(R, Is)].

% {U, D, L, R}
n1(Xs) -> call({n1, n4, n1, n2}, Xs, n1).	
n2(Xs) -> call({n2, n5, n1, n3}, Xs, n2).	
n3(Xs) -> call({n3, n6, n2, n3}, Xs, n3).	
n4(Xs) -> call({n1, n7, n4, n5}, Xs, n4).	
n5(Xs) -> call({n2, n8, n4, n6}, Xs, n5).	
n6(Xs) -> call({n3, n9, n5, n6}, Xs, n6).	
n7(Xs) -> call({n4, n7, n7, n8}, Xs, n7).	
n8(Xs) -> call({n5, n8, n7, n9}, Xs, n8).	
n9(Xs) -> call({n6, n9, n8, n9}, Xs, n9).	

% {U, D, L, R}
f1(Xs) -> call({f1, f3, f1, f1}, Xs, f1).	
f2(Xs) -> call({f2, f6, f2, f3}, Xs, f2).	
f3(Xs) -> call({f1, f7, f2, f4}, Xs, f3).	
f4(Xs) -> call({f4, f8, f7, f9}, Xs, f4).	
f5(Xs) -> call({f5, f5, f5, f6}, Xs, f5).	
f6(Xs) -> call({f2, fA, f5, f7}, Xs, f6).	
f7(Xs) -> call({f3, fB, f6, f8}, Xs, f7).	
f8(Xs) -> call({f4, fC, f7, f9}, Xs, f8).	
f9(Xs) -> call({f9, f9, f8, f9}, Xs, f9).
fA(Xs) -> call({f6, fA, fA, fB}, Xs, fA).
fB(Xs) -> call({f7, fD, fA, fC}, Xs, fB).
fC(Xs) -> call({f8, fC, fB, fC}, Xs, fC).
fD(Xs) -> call({fB, fD, fD, fD}, Xs, fD).


call(_, [], Calling) -> Calling;
call(Config, [X | Xs], _) ->
	% io:format("~s~n", [Calling]),
	apply(?MODULE, element(X, Config), [Xs]).

convert([]) -> [];
convert([S | Ss]) ->
	if
		S == 85 -> %U
			D = 1;
		S == 68 -> %D
			D = 2;
		S == 76 -> %L
			D = 3;
		S == 82 -> %R
			D = 4
	end,
	[D | convert(Ss)].
