-module(tut8).
-export([test_if/2]).

test_if(A, B) ->
    if
        A == 1, B == 1 ->
            io:format('A and B are the ONE :?~n');
        A == 1; B == 1 ->
            io:format('A or B are the ONE !!~n');
        A == 1 ->
            io:format('A is the ONE :O~n');
        B == 1 ->
            io:format('B is the ONE :O~n')
    end.
