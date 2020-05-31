oracion --> sujeto, verbo(G), predicado(G).

sujeto --> [el].
sujeto --> [ella].


verbo(a) --> [es].
verbo(b) --> [trabaja].
verbo(c) --> [tiene].

%Positivos
positivo('Si').
positivo('si').

%Negativos
negativo('No').
negativo('no').

%Omitibles
omitir('el').
omitir('la').
omitir('lo').
omitir('y').
omitir('de').
omitir('a').
omitir('un').
omitir('una').
omitir('uno').
omitir('en').
omitir('para').


%_________________________________%
%Input de usuario binario u oracion
%*********************************%
answer:-
  write("Por favor ingrese su respuesta"),nl,
  read(Resp),nl,
  %positivo(Resp), true;
  %negativo(Resp), !, false;
  write(Resp), inputtolist(Resp, List), write(List).

%_________________________________%
%Input de usuario (string) a lista
%*********************************%
inputtolist(Resp, L):- split_string(Resp, " ", "", L).

%_______________________________%
%Lista sin palabras innecesarias
%*******************************%
purgar([], Result, Result).
purgar([X|Y], Lista, Result):-not(omitir(X)), (add(Lista, X, NuevLista), purgar(Y, NuevLista, Result)); purgar(Y, Lista, Result).
purgar(Lista, Result):- purgar(Lista, [], Result).

%_______________________________%
%Add list to list
%*******************************%
add([], Elem, Elem).
add(List, Elem, [List|Elem]).

%_________________________________%
%Determinar si existe negacion
%*********************************%
negacion([]):-false.
negacion([X|Y]):- negativo(X), true; negacion(Y).

%_________________________________%
%Identificar si coinciden palabras
%*********************************%
coincide([], _):- false.
coincide([X|Y], Palabra):- X==Palabra, true; coincide(Y, Palabra).
