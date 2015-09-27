-module(tut6).
-export([list_max/1, list_min/1, reverse/1]).

list_max([Head | Rest]) ->
    list_max(Rest, Head).

list_max([], Res) ->
    Res;
list_max([Head | Rest], Res) when Head > Res ->
    list_max(Rest, Head);
list_max([_ | Rest], Res) ->
    list_max(Rest, Res).

list_min([Head | Rest]) ->
    list_min(Rest, Head).

list_min([], Res) ->
    Res;
list_min([Head | Rest], Res) when Head < Res ->
    list_min(Rest, Head);
list_min([_ | Rest], Res) ->
    list_min(Rest, Res).

reverse(List) ->
    reverse(List, []).
reverse([], Res) ->
    Res;
reverse([Head|Rest], Res) ->
    reverse(Rest, [Head | Res]).
