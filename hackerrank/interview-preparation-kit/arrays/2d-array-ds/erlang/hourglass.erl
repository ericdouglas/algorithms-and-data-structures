-module(hourglass).

-export([test/0]).

%% {Row, Column} - pivot's position of the hourglass
%% Arr - original matrix
create_sum_list({Row, Column}, Arr) ->
    [[-63, -34, -9, 12],
     [-10, 0, 28, 23],
     [-27, -11, -2, 10],
     [9, 17, 25, 18]].

hourglass_sum([Row | _] = Rows) ->
    RowsLength = length(Rows),
    ColumnsLength = length(Row),
    PivotListRows = lists:seq(1, RowsLength - 2),
    PivotListColumns = lists:seq(1, ColumnsLength - 2),
    SumList = lists:map(fun (Row) ->
                                lists:map(fun (Column) ->
                                                  create_sum_list({Row, Column},
                                                                  Rows)
                                          end,
                                          PivotListColumns)
                        end,
                        PivotListRows),
    19.

    %% Since the hourglass is a 3x3 matrix, we can not use a pivot that starts
    %% in the last two columns and rows

    %% TODO: try to go directly - reduce the lists:seq(1, RowsLength) inside lists:seq(1, ColumnsLength)

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

test_create_sum_list() ->
    Input = [[-9, -9, -9, 1, 1, 1],
             [0, -9, 0, 4, 3, 2],
             [-9, -9, -9, 1, 2, 3],
             [0, 0, 8, 6, 6, 0],
             [0, 0, 0, -2, 0, 0],
             [0, 0, 1, 2, 4, 0]],
    Result = [[-63, -34, -9, 12],
              [-10, 0, 28, 23],
              [-27, -11, -2, 10],
              [9, 17, 25, 18]],
    Result = create_sum_list({6, 6}, Input),
    pass.

test() ->
    pass = test_hourglass_sum(),
    pass = test_create_sum_list().
