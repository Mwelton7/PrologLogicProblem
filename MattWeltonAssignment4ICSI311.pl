%Matt Welton
%Assignment 4
%ICSI 311


character(lorotia).
character(poroth).
character(quekal).
character(wata).

wood(boxwood).
wood(chestnut).
wood(hickory).
wood(rosewood).

price(three).
price(five).
price(seven).
price(nine).

solve :-
	character(CodyCharacter), character(LarryCharacter),
	character(OliverCharacter), character(ZacharyCharacter),
	all_different([CodyCharacter,LarryCharacter,OliverCharacter,ZacharyCharacter]),
	
	wood(CodyWood), wood(LarryWood), wood(OliverWood), wood(ZacharyWood),
	all_different([CodyWood,LarryWood,OliverWood,ZacharyWood]),
	
	price(CodyPrice),price(LarryPrice),price(OliverPrice),price(ZacharyPrice),
	all_different([CodyPrice,LarryPrice,OliverPrice,ZacharyPrice]),
	
	Quadlist = [[cody,CodyCharacter,CodyWood,CodyPrice],
				[larry,LarryCharacter,LarryWood,LarryPrice],
				[oliver,OliverCharacter,OliverWood,OliverPrice],
				[zachary,ZacharyCharacter,ZacharyWood,ZacharyPrice]],
				
	%1Either larry made lorotia and chestnut was nine or larry was nine and lortia was chestnut
	
	((member([larry,lorotia,_,_], Quadlist),
	member([_,_,chestnut,nine], Quadlist));
	(member([larry,_,_,nine], Quadlist),
	member([_,lorotia,chestnut,_], Quadlist))),
	
	%2 neither not ambiguous two separate statements
	%poroth was not boxwood and larry did not make poroth
	
	not(member([_,poroth,boxwood,_], Quadlist)),
	not(member([larry,poroth,_,_], Quadlist)),
	
	%3 cody made wata and chestnut was three or wata was three and cody used chestnut
	
	((member([cody,wata,_,_], Quadlist),
	member([_,_,chestnut,three], Quadlist));
	(member([_,wata,_,three], Quadlist),
	member([cody,_,chestnut,_], Quadlist))),
	
	%4 xor De-morgan's law (P^-Q)V(-P^Q)
	
	((member([zachary,wata,_,_], Quadlist),
	not(member([_,wata,boxwood,_], Quadlist)));
	(not(member([zachary,wata,_,_], Quadlist)),
	member([_,wata,boxwood,_], Quadlist))),
	
	%5 link all three combinations of prices where they can be two less with or
	
	((member([_,poroth,_,nine], Quadlist),
	member([_,_,chestnut,seven], Quadlist));
	(member([_,poroth,_,seven], Quadlist),
	member([_,_,chestnut,five], Quadlist));
	(member([_,poroth,_,five], Quadlist),
	member([_,_,chestnut,three], Quadlist))),
	
	%6link the two possible combinations of prices where they can be four less
	
	((member([_,lorotia,_,five], Quadlist),
	member([_,_,rosewood,nine], Quadlist));
	(member([_,lorotia,_,three], Quadlist),
	member([_,_,rosewood,seven], Quadlist))),
	
	tell(cody,CodyCharacter,CodyWood,CodyPrice),
	tell(larry,LarryCharacter,LarryWood,LarryPrice),
	tell(oliver,OliverCharacter,OliverWood,OliverPrice),
	tell(zachary,ZacharyCharacter,ZacharyWood,ZacharyPrice).
	
	all_different([H|T]):- member(H,T),!,fail.
	all_different([_|T]):- all_different(T).
	all_different([_]).
	
	tell(X,Y,Z,Q):-
		write('Person: '), write(X), write(' Character: '), write(Y),
		write(' Wood Type: '), write(Z), write(' Price: '), write(Q),nl.