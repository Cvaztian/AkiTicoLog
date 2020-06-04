%______________________________________%
%Estructura del Motor de Inferencia BNF
%**************************************%
%Distintas estructuras de respuestas posibles para analisis
oracion --> afirmacion.                                               %Oracion binaria positiva
oracion --> negacion.                                                 %Oracion binaria negativa
oracion --> sintagma_nominal, sintagma_verbal.                        %Oracion completa
sintagma_nominal --> pronombre.                                       %forma: "ella"
sintagma_nominal --> negacion, pronombre.                             %forma: "no, ella"
sintagma_nominal --> adj_pos, sujeto.                                 %forma: "mi personaje"
sintagma_verbal --> verbo(G), predicado(G).                           %forma: "es flaco"
sintagma_verbal --> verbo(G), articulo_indef, predicado(G).           %forma: "es una caricatura"
sintagma_verbal --> verbo(G), preposicion, predicado(G).              %forma: "trabaja en teletica"
sintagma_verbal --> verbo(G), preposicion, articulo_def, predicado(G).%forma "trabaja para la nasa"
%Antonimos (caso especial de oracion)                                 %Esta estructura permite determinar el valor contrario a lo que el usuario niega. Ej: No hombre => mujer
antonimo --> sintagma_nominal, sintagma_verbal_neg.                   %Oracion con una negacion
sintagma_verbal_neg --> negacion, sintagma_verbal.                    %forma: "no es real"

%Afirmaciones
afirmacion --> [si].

%Negaciones
negacion --> [no].

%Pronombres
pronombre --> [el].
pronombre --> [ella].

%sujeto
sujeto --> [personaje].

%Articulos
articulo_def --> [la].
articulo_def --> [el].
articulo_indef --> [un].
articulo_indef --> [una].

%adjetivo posesivo
adj_pos --> [mi].

%preposiciones
preposicion --> [para].
preposicion --> [en].
preposicion --> [de].

%Verbo ser (tipo a)
verbo(a) --> [es].
%Verbo trabajar (tipo b)
verbo(b) --> [trabaja].
%Verbo tener (tipo c)
verbo(c) --> [lleva].
verbo(c) --> [tiene].
verbo(c) --> [usa].

%Predicados para verbo ser (tipo a)
predicado(a) --> [presentador].
predicado(a) --> [presentadora].
predicado(a) --> [humorista].
predicado(a) --> [futbolista].
predicado(a) --> [nadador].
predicado(a) --> [nadadora].
predicado(a) --> [fisico].
predicado(a) --> [ingeniero].
predicado(a) --> [astronauta].
predicado(a) --> [cientifico].

predicado(a) --> [extranjero].
predicado(a) --> [ucr].

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
predicado(a) --> [negro].

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

%Antonimos
%args: valor, valor contrario
contrario(real, caricatura).
contrario(caricatura, real).
contrario(hombre, mujer).
contrario(mujer, hombre).
contrario(lentes, nao).

%_________________________________%
%Input de usuario binario u oracion
%*********************************%
answer(Valor, Tipo):-
  write("Por favor ingrese su respuesta"),nl,
  read(Resp), nl,
  (Resp=='si',
    (Tipo==real, Valor=[real];
     Tipo==afilanim, Valor=[teletica];
     Tipo==afilfut, Valor=[realMadrid];
     Tipo==afilcient, Valor=[p];
     Tipo==afilcient2, Valor=[uCR];
     Tipo==gen, Valor=[hombre];
     Tipo==col, Valor=[amarillo];
     Tipo==len, Valor=[si];
     Tipo==col_fut, Valor=[negro]
     );
   Resp=='no',
   (Tipo==real, Valor=[caricatura];
     Tipo==afilanim, Valor=[a];
     Tipo==gen, Valor=[mujer];
     Tipo==afilcient, Valor=[nASA];
     Tipo==afilcient2, Valor=[tEC];
     Tipo==col, Valor=[verde];
     Tipo==len, Valor=[nao];
     Tipo==col_fut, Valor=[nao];
     Tipo==afilfut, Valor=[clubLeon]
     );
  inputtolist(Resp, Liststr), atom_list(Liststr, Listatom),   %formatea a atomos
  (antonimo(Listatom, []), gener_vals_cons(Listatom, Valor);   %Verifica si es una negacion
  oracion(Listatom, []), gener_vals(Listatom, Valor) ));       %Verifica si es una oracion valida
  write("La estructura de su respuesta es incorrecta."), nl, write("Intente nuevamente"), nl, answer(Valor, Tipo).

%______________________________________________%
%Input de usuario (string) a lista de strings
%args: string de respuesta, lista de substrings
%**********************************************%
inputtolist(Resp, L):- split_string(Resp, " ", ",", L).   %split_string(String, separadores, caracteres relleno, lista substrings)

%__________________________________%
%Lista de strings a lista de atomos
%args: lista strings, lista atomos
%**********************************%
atom_list([], []).
atom_list([Hstr|Tstr], [Hatom|Tatom]):- atom_string(Hatom, Hstr), atom_list(Tstr, Tatom).

%____________________________________________________________________%
%Generar valores
%args: oracion como lista de atomos, resultado como lista de un atomo
%********************************************************************%
gener_vals([Ultimo], [Ultimo]).
gener_vals([_|Tail], Resp):- gener_vals(Tail, Resp).

%______________________________________________%
%Generar valores contrarios
%args: oracion como lista de atomos, antonimo
%**********************************************%
gener_vals_cons([Ultimo], Anton):- contrario(Ultimo, Anton).
gener_vals_cons([_|Tail], Resp):- gener_vals_cons(Tail, Resp).
