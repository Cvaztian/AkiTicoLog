%______________________________________%
%Estructura del Motor de Inferencia BNF
%**************************************%
%Distintas estructuras de respuestas posibles para analisis
oracion --> afirmacion.                                               %Oracion binaria positiva
oracion --> negacion.                                                 %Oracion binaria negativa
oracion --> sintagma_nominal, sintagma_verbal.                        %Oracion completa
sintagma_nominal --> pronombre.                                       %forma: "ella"
sintagma_nominal --> negacion, pronombre.                             %forma: "no, ella"
sintagma_verbal --> verbo(G), predicado(G).                           %forma: "es flaco"
sintagma_verbal --> verbo(G), preposicion, predicado(G).              %forma: "trabaja en teletica"
sintagma_verbal --> verbo(G), preposicion, articulo, predicado(G).    %forma "trabaja para la nasa"

%Afirmaciones
afirmacion --> [si].

%Negaciones
negacion --> [no].
negacion_hecho(no).

%Pronombres
pronombre --> [el].
pronombre --> [ella].

%Articulos
articulo --> [la].
articulo --> [el].

%preposiciones
preposicion --> [para].
preposicion --> [en].

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

predicado(a) --> [extranjero].

predicado(a) --> [musculoso].
predicado(a) --> [flaco].
predicado(a) --> [grueso].
predicado(a) --> [afrodescendiente].
predicado(a) --> [cuacasica].
predicado(a) --> [pequeno].
predicado(a) --> [alto].
predicado(a) --> [hombre].
predicado(a) --> [mujer].
predicado(a) --> [risueno].
predicado(a) --> [amarillo].
predicado(a) --> [azul].
predicado(a) --> [verde].

predicado(a) --> [real].
predicado(a) --> [caricatura].

%Predicados para verbo trabajar (tipo b)
predicado(b) --> [teletica].
predicado(b) --> [nasa].
predicado(b) --> [tec].
predicado(b) --> [ucr].
predicado(b) --> [realMadrid].
predicado(b) --> [seleccionNacional].
predicado(b) --> [clubLeon].
predicado(b) --> [ice].
predicado(b) --> [gollo].
%Predicados para verbo tener (tipo c)
predicado(c) --> [pelocorto].
predicado(c) --> [tatuajes].
predicado(c) --> [anteojos].
predicado(c) --> [lentes].

%_________________________________%
%Input de usuario binario u oracion
%*********************************%
answer(Valor):-
  write("Por favor ingrese su respuesta"),nl,
  read(Resp),nl,
  inputtolist(Resp, Liststr), atom_list(Liststr, Listatom), oracion(Listatom, []), gener_vals(Listatom, Valor);
  write("La estructura de su respuesta es incorrecta."), nl, write("Intente nuevamente"), nl, answer(Valor).

%______________________________________________%
%Input de usuario (string) a lista de strings
%args: string de respuesta, lista de substrings
%**********************************************%
inputtolist(Resp, L):- split_string(Resp, " ", ",", L).

%__________________________________%
%Lista de strings a lista de atomos
%args: lista strings, lista atomos
%**********************************%
atom_list([], []).
atom_list([Hstr|Tstr], [Hatom|Tatom]):- atom_string(Hatom, Hstr), atom_list(Tstr, Tatom).

%______________________________%
%Determinar signo de la oracion
%args: lista de atomos
%******************************%
negacion_regla([]):- fail.
negacion_regla([Head|Tail]):-
  negacion_hecho(Head), true;
  negacion_regla(Tail).

%______________________________________________%
%Generar valores
%args: oracion como lista de atomos
%**********************************************%
gener_vals([Ultimo], [Ultimo]).
gener_vals([Head|Tail], Resp):- gener_vals(Tail, Resp).

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
