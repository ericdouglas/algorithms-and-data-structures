-module(repeat).

-export([test/0]).

%% 97 is the unicode for letter "a"
count_comparison(String, Acc) when String == 97 ->
    Acc + 1;
count_comparison(_, Acc) -> Acc.

repeated_string(String, Size) ->
    CompleteStringTimes = Size div length(String),
    PartialStringSize = Size rem length(String),
    CompleteString = [string:copies(String, CompleteStringTimes)],
    PartialString = string:substr(String, 1, PartialStringSize),
    FullString = lists:concat(CompleteString ++ [PartialString]),
    lists:foldl(fun count_comparison/2, 0, FullString).

test_repeated_string() ->
    2 = repeated_string("dia", 7),
    7 = repeated_string("aba", 10),
    10 = repeated_string("a", 10),
    pass.

test() -> pass = test_repeated_string().
