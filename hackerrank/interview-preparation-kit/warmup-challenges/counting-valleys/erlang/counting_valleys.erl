-module(counting_valleys).

-compile(export_all).

check_new_place(Current, NewPlace)
    when Current == 0, NewPlace > 0 ->
    mountain;
check_new_place(Current, NewPlace)
    when Current == 0, NewPlace < 0 ->
    valley;
check_new_place(_, _) ->
    nada_acontece_feijoada. % obs: this atom is a joke

%% N: number - number of steps
%% S: string - all steps e.g UUDDUD
counting_valleys(_N, S) ->
    Result = lists:foldl(fun (Next,
                              {{valley, ValleyCount},
                               {mountain, MountainCount},
                               {current, Current}}) ->
                                 %% D = 68
                                 %% U = 85
                                 NewPlace = case Next == 68 of
                                                true -> -1;
                                                false -> 1
                                            end,
                                 case check_new_place(Current, NewPlace) of
                                     mountain ->
                                         {{valley, ValleyCount},
                                          {mountain, MountainCount + 1},
                                          {current, Current + NewPlace}};
                                     valley ->
                                         {{valley, ValleyCount + 1},
                                          {mountain, MountainCount},
                                          {current, Current + NewPlace}};
                                     _ ->
                                         {{valley, ValleyCount},
                                          {mountain, MountainCount},
                                          {current, Current + NewPlace}}
                                 end
                         end,
                         {{valley, 0}, {mountain, 0}, {current, 0}},
                         S),
    element(2, element(1, Result)).

test_counting_valleys() ->
    1 = counting_valleys(8, "UDDDUDUU"),
    2 = counting_valleys(12, "DDUUDDUDUUUD"),
    pass.

test() -> pass = test_counting_valleys().
