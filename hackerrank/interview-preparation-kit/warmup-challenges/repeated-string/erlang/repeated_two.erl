-module(repeated_two).

-export([test/0]).

count_pattern(String) ->
    RegExp = "[a]",
    case re:run(String, RegExp) of
        {match, [{Captured, _}]} -> Captured;
        nomatch -> String
    end.

repeated_string(String, Size) ->
    CompleteStringTimes = Size div length(String),
    PartialStringSize = Size rem length(String),
    CompleteString = [string:copies(String, CompleteStringTimes)],
    PartialString = string:substr(String, 1, PartialStringSize),
    FullString = lists:concat(CompleteString ++ [PartialString]),
    count_pattern(FullString).

test_repeated_string() ->
    2 = repeated_string("dia", 7),
    7 = repeated_string("aba", 10),
    % 10 = repeated_string("a", 10),
    pass.

test() -> pass = test_repeated_string().