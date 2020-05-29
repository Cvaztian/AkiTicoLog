%_________________________________%
%Input de usuario (string) a lista
%*********************************%
inputtolist:-
    write("Por favor ingrese su respuesta"),nl,
    read(Resp),nl,
    write(Resp),nl,
    split_string(Resp, " ", "", L),
    write(L).


