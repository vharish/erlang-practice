-module(tut9).
-export([month_length/2]).

month_length(Month, Year) ->
    %%All years divisible by 400 are leap
    %%Years divisible by 100 are not leap(excpet the 400 rule)
    %%Years divisible by 4 are leap(except the 100 rule)
    Leap = if
               Year rem 400 == 0 ->
                   leap;
               Year rem 100 == 0 ->
                   not_leap;
               Year rem 4 == 0 ->
                   leap;
               true ->
                   not_leap
           end,
    case Month of
        dec -> 31;
        nov -> 30;
        oct -> 31;
        sep -> 30;
        aug -> 31;
        jul -> 31;
        jun -> 30;
        may -> 31;
        apr -> 30;
        mar -> 31;
        feb when Leap == leap -> 29;
        feb -> 28;
        jan -> 31
    end.
