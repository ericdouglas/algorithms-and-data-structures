-module(counting_two).

-export([test/0]).

counting_valleys(_N, Path) -> walk(Path, 0, 0).

%% "D" == 68
%% "U" == 85
walk([], _, Acc) -> Acc;
walk([H | T], Height, Acc) when H == 85, Height == -1 ->
    walk(T, Height + 1, Acc + 1);
walk([H | T], Height, Acc) when H == 85 ->
    walk(T, Height + 1, Acc);
walk([H | T], Height, Acc) when H == 68 ->
    walk(T, Height - 1, Acc);
walk([H | _], _, _) -> io:format("~p~n", [H]).

test_counting_valleys() ->
    1 = counting_valleys(8, "UDDDUDUU"),
    2 = counting_valleys(12, "DDUUDDUDUUUD"),
    pass.

test() -> pass = test_counting_valleys().
