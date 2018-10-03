person(langone).
person(barnes).
person(demetri).
person(hugh).

object(balloon).
object(frisbee).
object(clothesline).
object(watertower).

type(circle).
type(amusement).
type(cord).
type(giant).

day(tuesday).
day(wednesday).
day(thrusday).
day(friday).

solution :-
    object(Object_Langone),
    object(Object_Barnes),
    object(Object_Demetri),
    object(Object_Hugh),
    all_variable([Object_Langone, Object_Barnes, Object_Demetri, Object_Hugh]),

    type(Feature_Langone),
    type(Feature_Barnes),
    type(Feature_Demetri),
    type(Feature_Hugh),
    all_variable([Feature_Langone, Feature_Barnes, Feature_Demetri, Feature_Hugh]),

    day(Day_Langone),
    day(Day_Barnes),
    day(Day_Demetri),
    day(Day_Hugh),
    all_variable([Day_Langone,Day_Barnes,Day_Demetri,Day_Hugh]),

    Triples = [ [langone, Object_Langone, Feature_Langone,Day_Langone],
                [barnes, Object_Barnes, Feature_Barnes,Day_Barnes],
                [demetri,Object_Demetri, Feature_Demetri,Day_Demetri],
                [hugh, Object_Hugh, Feature_Hugh,Day_Hugh] ],




     member([barnes,_,_,friday],Triples),
    \+ member([_,balloon,_,thrusday],Triples),
     member([_,balloon,_,friday],Triples),



    \+ member([langone,clothesline,_,wednesday],Triples),
     member([langone,clothesline,_,thrusday],Triples),

     member([hugh,_,_,tuesday],Triples),
     member([demetri,_,_,wednesday],Triples),
    \+member([demetri,_,_,thrusday],Triples),




    tell(Day_Langone,langone, Object_Langone, Feature_Langone),
    tell(Day_Barnes,barnes, Object_Barnes, Feature_Barnes),
    tell(Day_Demetri,demetri,Object_Demetri, Feature_Demetri),
    tell(Day_Hugh,hugh, Object_Hugh, Feature_Hugh).


all_variable([H | T]) :- member(H, T), !, fail.
all_variable([_ | T]) :- all_variable(T).
all_variable([_]).

tell(W,X, Y, Z) :-
    write('On'),write(' '), write(W),write(','),write(X), write(' sighted '), write(Y),
    write(' that is similar to '), write(Z), write(' feature'), write('.'), nl.
