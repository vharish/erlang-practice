-module(tut7).
-export([format_temp/1, find_max/1, find_max_and_min/1]).

format_temp(List) ->
    Converted_List = convet_list_to_c(List),
    print_temp(Converted_List).

convet_list_to_c([]) ->
    [];
convet_list_to_c([{City, {c, Temp}}| Rest]) ->
    [{City, {c, Temp}} | convet_list_to_c(Rest)];
convet_list_to_c([{City, {f, Temp}}| Rest]) ->
    [{City, {c, (Temp - 32) * 5 / 9}}| convet_list_to_c(Rest)].

print_temp([]) ->
    ok;
print_temp([{City, {c, Temp}}|Rest]) ->
    io:format('~-15w ~p c~n', [City, Temp]),
    print_temp(Rest).

find_max([]) ->
    [];
find_max([Head|Rest]) ->
    find_max(Rest, Head).

find_max([], Res) ->
    Res;
find_max([{City, {c, Temp}}|Rest], {_, {c, CTemp}}) when Temp > CTemp ->
    find_max(Rest, {City, {c, Temp}});
find_max([_|Rest], Res) ->
    find_max(Rest, Res).

find_max_and_min([]) ->
    [];
find_max_and_min([Head | Rest]) ->
    find_max_and_min(Rest, Head, Head).

find_max_and_min([], Max_city, Min_city) ->
    {Max_city, Min_city};
find_max_and_min([{City, {c, Temp}}|Rest],
                 {Max_city, {c, Max_temp}},
                 {Min_city, {c, Min_temp}}) ->
    if
        Temp > Max_temp ->
            New_max = {City, {c, Temp}};
        true ->
            New_max = {Max_city, {c, Max_temp}}
    end,
    if
        Temp < Min_temp ->
            New_min = {City, {c, Temp}};
        true ->
            New_min = {Min_city, {c, Min_temp}}
    end,
    find_max_and_min(Rest, New_max, New_min).
