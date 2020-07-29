-module(array_2d).

-export([test/0]).

hour_glass_sum(_Arr) -> 19.

test_hour_glass_sum() ->
    Input = [[1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0],
             [1, 1, 1, 0, 0, 0],
             [0, 0, 2, 4, 4, 0],
             [0, 0, 0, 2, 0, 0],
             [0, 0, 1, 2, 4, 0]],
    19 = hour_glass_sum(Input),
    pass.

test() -> pass = test_hour_glass_sum().
