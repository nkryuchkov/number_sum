get_separator_list(List) :-
	numlist(1, 47, List1),
	numlist(58, 255, List2),
	append(List1, List2, List).

get_digits(String, Digits) :-
	get_separator_list(SepChars),
	split_string(String, SepChars, SepChars, Digits).

get_numbers([], []).
get_numbers([Digits|NextDigits], [Numbers|NextNumbers]) :-
	string_to_list(Digits, List),
	number_string(Numbers, List),
	get_numbers(NextDigits, NextNumbers).
	
sum_numbers([], 0).
sum_numbers([Head|Tail], Sum) :-
    sum_list(Tail, Rest),
    Sum is Head + Rest.

sum([], 0).
sum(String, Sum) :-
    get_digits(String, Digits),
    get_numbers(Digits, Numbers),
    sum_numbers(Numbers, Sum).



