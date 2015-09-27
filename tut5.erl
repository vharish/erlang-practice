-module(tut5).
-export([format_temp/1]).

format_temp([]) ->
    ok;
format_temp([First|Rest]) ->
    print_temp(convert_to_celsuis(First)),
    format_temp(Rest).

convert_to_celsuis({City, {c, Temp}}) ->
    {City, {c, Temp}};
convert_to_celsuis({City, {f, Temp}}) ->
    {City, {c, (Temp - 32) * 5 / 9}}.

print_temp({City, {c, Temp}}) ->
    io:format('Temperate in city ~w:~p~n', [City, Temp]).
