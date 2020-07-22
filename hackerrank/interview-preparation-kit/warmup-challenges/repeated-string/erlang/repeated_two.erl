-module(repeated_two).

-export([test/0]).

repeated_string(String, Size) when Size =< 0 -> String;
repeated_string(String, Size) ->
    repeated_string(String ++ String,
                    Size - length(String) - 1).

test_repeated_string() ->
    "abab" = repeated_string("ab", 3),
    pass.

test() -> pass = test_repeated_string().
