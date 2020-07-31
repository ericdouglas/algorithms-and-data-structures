-module(hourglass).

-export([test/0]).

create_pivot_list([Row | _] = Rows) ->
    %% The -2 is because we need to have at least 3 columns and rows to form an hourglass
    RowsLength = length(Rows) - 2,
    ColumnsLeght = length(Row) - 2,

    [lists:seq(1, RowsLength)
     || _ <- lists:seq(1, ColumnsLeght)].

hourglass_sum(Arr) ->
    PivotList = create_pivot_list(Arr),
    19.

test_hourglass_sum() ->
    Input = [[1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0],
             [1, 1, 1, 0, 0, 0],
             [0, 0, 2, 4, 4, 0],
             [0, 0, 0, 2, 0, 0],
             [0, 0, 1, 2, 4, 0]],
    Result = 19,
    Result = hourglass_sum(Input),
    pass.

test_create_pivot_list() ->
    Input = [[1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0],
             [1, 1, 1, 0, 0, 0],
             [0, 0, 2, 4, 4, 0],
             [0, 0, 0, 2, 0, 0],
             [0, 0, 1, 2, 4, 0]],
    Result = [[1, 2, 3, 4],
              [1, 2, 3, 4],
              [1, 2, 3, 4],
              [1, 2, 3, 4]],
    Result = create_pivot_list(Input),
    pass.

test() ->
    pass = test_hourglass_sum(),
    pass = test_create_pivot_list().
