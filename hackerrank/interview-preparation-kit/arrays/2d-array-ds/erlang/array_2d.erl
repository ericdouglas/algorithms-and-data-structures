-module(array_2d).

-export([test/0]).

create_pivot_list(Arr, {Rows, Columns}) ->
    TempList = lists:map(fun (Item) ->
                                 lists:sublist(Item, Columns - 2)
                         end,
                         Arr),
    lists:sublist(TempList, Rows - 2).

%% output: [{1, [...], {2, [...]}, ...]
add_index_to_list_items(Arr) ->
    lists:zip(lists:seq(1, length(Arr)), Arr).

create_pivot_list_with_index(Arr) ->
    ListsWithRowIdentifier = add_index_to_list_items(Arr),
    lists:map(fun ({Index, List}) ->
                      {Index, add_index_to_list_items(List)}
              end,
              ListsWithRowIdentifier).

% create_list_with_hourglasses_sum(OriginalArr, ArrWithIndexes) ->

hour_glass_sum([Row | Rest] = Arr) ->
    RowsLength = length(Arr),
    ColumnsLength = length(Row),
    PivotList = create_pivot_list(Arr,
                                  {RowsLength, ColumnsLength}),
    PivotListWithIndex =
        create_pivot_list_with_index(PivotList),
    % SumList = create_list_with_hourglasses_sum(Arr, PivotListWithIndex),
    19.

    % case Rows < 3 or Columns < 3 of
    %   true -> % return
    % end

test_hour_glass_sum() ->
    Input = [[1, 1, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0],
             [1, 1, 1, 0, 0, 0],
             [0, 0, 2, 4, 4, 0],
             [0, 0, 0, 2, 0, 0],
             [0, 0, 1, 2, 4, 0]],
    19 = hour_glass_sum(Input),
    pass.

test_create_pivot_list() ->
    Input = [[0, 6, 3, 1, 4, 5],
             [2, 3, 4, 0, 1, 3],
             [4, 4, 2, 5, 1, 3],
             [6, 2, 1, 9, 1, 3],
             [8, 3, 1, 0, 6, 3],
             [2, 1, 1, 0, 7, 3]],
    Result = [[0, 6, 3, 1],
              [2, 3, 4, 0],
              [4, 4, 2, 5],
              [6, 2, 1, 9]],
    Result = create_pivot_list(Input, {6, 6}),
    pass.

test_create_pivot_list_with_index() ->
    Input = [[3, 1], [4, 3]],
    Result = [{1, [{1, 3}, {2, 1}]}, {2, [{1, 4}, {2, 3}]}],
    Result = create_pivot_list_with_index(Input),
    pass.

test() ->
    pass = test_hour_glass_sum(),
    pass = test_create_pivot_list(),
    pass = test_create_pivot_list_with_index().
