%______________________________________%
%Estructura del Motor de Inferencia BNF
%**************************************%
%Distintas estructuras de respuestas posibles para analisis
oracion --> afirmacion.                                             %Oracion binaria positiva
oracion --> negacion.                                               %Oracion binaria negativa
oracion --> articulo_determinado, verbo(G), predicado(G).           %Oracion con la forma "El es astronatua"

%Afirmaciones
afirmacion --> [si].

%Negaciones
negacion --> [no].

%Determinantes
articulo_determinado --> [el].
articulo_determinado --> [ella].

%Verbo ser (tipo a)
verbo(a) --> [es].
%Verbo trabajar (tipo b)
verbo(b) --> [trabaja].
%Verbo tener (tipo c)
verbo(c) --> [tiene].

%Predicados para verbo ser (tipo a)
predicado(a) --> [presentador].
predicado(a) --> [humorista].
predicado(a) --> [futbolista].
predicado(a) --> [nadador].
predicado(a) --> [fisico].
predicado(a) --> [ingeniero].
predicado(a) --> [astronauta].
predicado(a) --> [cientifico].

predicado(a) --> [pequenno].
predicado(a) --> [alto].

predicado(a) --> [extranjero].

predicado(a) --> [musculoso].
predicado(a) --> [flaco].
predicado(a) --> [grueso].
predicado(a) --> [afrodescendiente].
predicado(a) --> [cuacasica].

predicado(a) --> [risueno].

predicado(a) --> [caricatura].
%Predicados para verbo trabajar (tipo b)
predicado(b) --> [teletica].
predicado(b) --> [nasa].
predicado(b) --> [tec].
predicado(b) --> [ucr].
%Predicados para verbo tener (tipo c)
predicado(c) --> [pelocorto].
predicado(c) --> [tatuajes].
predicado(c) --> [anteojos].

%_________________________________%
%Input de usuario binario u oracion
%*********************************%
answer:-
  write("Por favor ingrese su respuesta"),nl,
  read(Resp),nl,
  inputtolist(Resp, Liststr), atom_list(Liststr, Listatom),
  oracion(Listatom, []).

%____________________________________________%
%Input de usuario (string) a lista de strings
%********************************************%
inputtolist(Resp, L):- split_string(Resp, " ", "", L).

%__________________________________%
%Lista de strings a lista de atomos
%**********************************%
atom_list([], []).
atom_list([Hstr|Tstr], [Hatom|Tatom]):- atom_string(Hatom, Hstr), atom_list(Tstr, Tatom).

%_______________________________%
%Lista sin palabras innecesarias
%*******************************%
%purgar([], Result, Result).
%purgar([X|Y], Lista, Result):-not(omitir(X)), (add(Lista, X, NuevLista), purgar(Y, NuevLista, Result)); purgar(Y, Lista, Result).
%purgar(Lista, Result):- purgar(Lista, [], Result).

%_______________________________%
%Add list to list
%*******************************%
add([], Elem, Elem).
add(List, Elem, [List|Elem]).

%_________________________________%
%Determinar si existe negacion
%*********************************%
%negacion([]):-false.
%negacion([X|Y]):- negativo(X), true; negacion(Y).

%_________________________________%
%Identificar si coinciden palabras
%*********************************%
%coincide([], _):- false.
%coincide([X|Y], Palabra):- X==Palabra, true; coincide(Y, Palabra).
