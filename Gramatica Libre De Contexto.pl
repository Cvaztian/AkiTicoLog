inputtolist:-
    write("Por favor ingrese su respuesta"),nl,
    read(Resp),nl,
    write(Resp),nl,
    split_string(Resp, " ", "", L),
    oracion(L, []).


oracion --> sujeto, verbo(G), predicado(G).


sujeto --> [el].
sujeto --> [ella].


verbo(a) --> [es].

verbo(b) --> [trabaja].


predicado(a) --> [presentador].
predicado(a) --> [humorista].
predicado(a) --> [futbolista].
predicado(a) --> [nadador].
predicado(a) --> [fisico].
predicado(a) --> [ingeniero].
predicado(a) --> [astronauta].
predicado(a) --> [cientifico].

predicado(b) --> [teletica].













