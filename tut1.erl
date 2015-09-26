-module(tut1).
-export([double/1, fact/1, mul/2, add/2]).

double(X) ->
    2 * X.

fact(1) ->
    1;
fact(X) ->
    X * fact(X-1).

add(X,Y) ->
    X + Y.

mul(X,Y) ->
    X * Y.
