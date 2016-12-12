-module(aoc_4).
-export([part1/1]).

part1(Input) ->
	extract(Input).

extract(Input) ->
	{ok, Reg} = re:compile("(?<s>[\\w|\\-]+)\\-(?<n>\\d+)\\[(?<c>.+)\\]"),
	{re:replace(extract2(Input, Reg, s), "-", "", [global, {return,list}]), extract2(Input, Reg, n), extract2(Input, Reg, c)}.
extract2(Input, Reg, Group) ->
	lists:last(e(2, re:run(Input, Reg, [{capture, [Group], list}]))).

e(N, T) ->
	element(N, T).
