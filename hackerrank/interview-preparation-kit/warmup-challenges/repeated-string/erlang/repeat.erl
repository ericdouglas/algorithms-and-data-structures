-module(repeat).

-compile(export_all).

%% [97] == "a"
count_comparison(String, Acc) when String == [97] ->
    Acc + 1;
count_comparison(_, Acc) -> Acc.

% count_comparison(<<"a">>, Acc) ->
%     io:format("::: Acc"),
%     erlang:display(Acc),
%     Acc + 1;
% count_comparison(El, Acc) ->
%     io:format("::: El "),
%     erlang:display(El),
%     Acc.

repeated_string(String, Size) ->
    CompleteStringTimes = Size div length(String),
    PartialStringSize = Size rem length(String),
    CompleteStringPart = [String
                          || _ <- lists:seq(1, CompleteStringTimes)],
    {PartialStringPart, _} = lists:split(PartialStringSize,
                                         String),
    FullString = lists:concat(CompleteStringPart ++
                                  PartialStringPart),
    io:format("::: FullString"),
    erlang:display(FullString),
    lists:foldl(fun count_comparison/2, 0, FullString).

test_repeated_string() ->
    2 = repeated_string("dia", 7),
    % 7 = repeated_string("aba", 10),
    % 1000000000000 = repeated_string("a", 1000000000000),
    pass.

test() -> pass = test_repeated_string().
