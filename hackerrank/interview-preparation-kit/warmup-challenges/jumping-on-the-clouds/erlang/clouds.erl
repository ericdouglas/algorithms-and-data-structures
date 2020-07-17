-module(clouds).

-export([jumping_on_clouds/1, test/0]).

jumps([], Acc) -> Acc;
jumps([_], Acc) -> Acc;
jumps([_, 0], Acc) -> Acc + 1;
jumps([1, 1], Acc) -> Acc;
jumps([_Current, _, 0 | Rest], Acc) ->
    jumps([0 | Rest], Acc + 1);
jumps([_Current, 0, 1 | Rest], Acc) ->
    jumps([0, 1 | Rest], Acc + 1).

jumping_on_clouds(List) -> jumps(List, 0).

test_jumping_on_clouds() ->
    4 = jumping_on_clouds([0, 0, 1, 0, 0, 1, 0]),
    3 = jumping_on_clouds([0, 0, 0, 0, 1, 0]),
    3 = jumping_on_clouds([0, 0, 0, 1, 0, 0]),
    pass.

test() -> pass = test_jumping_on_clouds().
