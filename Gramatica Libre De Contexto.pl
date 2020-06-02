inputtolist:-
    write("Por favor ingrese su respuesta"),nl,
    read(Resp),nl,
    write(Resp),nl,
    split_string(Resp, " ", "", L),
    oracion(L, []), write("Acachete").


oracion --> sujeto, verbo(G), predicado(G).

sujeto --> [el].
sujeto --> [ella].


verbo(a) --> [es].

verbo(b) --> [trabaja].

verbo(c) --> [tiene].




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

predicado(a) --> [risuenno].

predicado(a) --> [caricatura].


predicado(b) --> [teletica].
predicado(b) --> [nASA].
predicado(b) --> [tEC].
predicado(b) --> [uCR].




predicado(c) --> [pelocorto].
predicado(c) --> [tatuajes].
predicado(c) --> [anteojos].







