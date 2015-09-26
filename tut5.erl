-module(tut5).
-export([format_temp/1]).

print_temp([]) ->
    io:format('done~n');
print_temp([{City, {c, Temp}}|Rest]) ->
    io:format('Temperate in city ~w:~p~n', [City, Temp]),
    print_temp(Rest).

convert_to_celsuis({City, {c, Temp}}) ->
    {City, {c, Temp}};
convert_to_celsuis({City, {f, Temp}}) ->
    {City, {c, (Temp - 32) * 5 / 9}}.

convert([]) ->
    [];
convert([First | Rest]) ->
    [convert_to_celsuis(First) | convert(Rest)].

format_temp([H|T]) ->
    print_temp(convert([H|T])).

