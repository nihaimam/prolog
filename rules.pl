/** Niha Imam
 *  CS 330-002
 */


/**
 * rules
 */


valid_list(L):-
	valid_list([], L).

valid_list(Acum, Result):-
	package(P),
	notmember(P, Acum),
	valid_list([P|Acum], Result),!.

valid_list(Acum, Acum).

notmember(_, []).

notmember(P, [P|_]):-
	!,fail.

notmember(X, [_|T]):-
	notmember(X,T).

is_dependency(P, [H|_]):-
	depends(H,P),!.

is_dependency(P, [_|T]):-
	is_dependency(P, T).

get_dependencies(P, Dep, L):-
	depends(P, D),
	notmember(D,L),
	get_dependencies(P, Dep, [D|L]),!.

get_dependencies(_, D, D).

unsatisfied_dependency(P,L):-
	notmember(P,L),
	is_dependency(P,L),!.

unsatisfied_dependency([H|T]):-
	get_dependencies(H, HD, []),
	valid_list(HD),
	!,
	unsatisfied_dependency(T).

unsatisfied_dependency([H|_]):-
	get_dependencies(H, _, []),!.

unsatisfied_dependency([_|T]):-
	unsatisfied_dependency(T).

dependency_check(L):-
	unsatisfied_dependency(L),
	!,fail.

dependency_check(_).

ext_depends(P1, P2):-
	depends(P1, P2),!.

ext_depends(P1, P2):-
	depends(P1, X),
	ext_depends(X,P2),!.