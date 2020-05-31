%%% Hechos

persona('Mauricio Hoffman').
persona('Victor Carvajal').
persona('Carlos Ramos').
persona('Keylor Navas').
persona('Joel Campbell').
persona('Claudia Poll').
persona('Frankling Chang').
persona('Ivan Vargas').
persona('Clodomiro Picado').
persona('Pilar Cisneros').

ocupacion('Mauricio Hoffman', presentador).
ocupacion('Victor Carvajal', presentador).
ocupacion('Pilar Cisneros', presentador).
ocupacion('Carlos Ramos', humorista).
ocupacion('Keylor Navas', futbolista).
ocupacion('Joel Campbell', futbolista).
ocupacion('Claudia Poll', nadador).
ocupacion('Frankling Chang', fisico).
ocupacion('Ivan Vargas', fisico).
ocupacion('Frankling Chang', ingeniero).
ocupacion('Frankling Chang', astronauta).
ocupacion('Frankling Chang', cientifico).
ocupacion('Clodomiro Picado', cientifico).
ocupacion('Ivan Vargas', cientifico).

afiliacion('Mauricio Hoffman', teletica).
afiliacion('Victor Carvajal', teletica).
afiliacion('Pilar Cisneros', teletica).
afiliacion('Keylor Navas', realMadrid).
afiliacion('Keylor Navas', seleccionNacional).
afiliacion('Joel Campbell', seleccionNacional).
afiliacion('Joel Campbell', clubLeon).
afiliacion('Frankling Chang', nASA).
afiliacion('Ivan Vargas', tEC).
afiliacion('Clodomiro Picado', uCR ).
afiliacion('Rana de Kolbi', iCE).
afiliacion('Tren de Teletica', teletica).
afiliacion('Gallo Gollo', gollo).


genero('Mauricio Hoffman', masculino).
genero('Victor Carvajal', masculino).
genero('Carlos Ramos', masculino).
genero('Keylor Navas', masculino).
genero('Joel Campbell', masculino).
genero('Ivan Vargas', masculino).
genero('Clodomiro Picado', masculino).
genero('Frankling Chang', masculino).
genero('Claudia Poll', femenino).
genero('Pilar Cisneros', femenino).

reconocimientos('Ivan Vargas', ['Primer', descarga, de, plasma, en, latinoamerica]).
reconocimientos('Ivan Vargas', ['Premio', nacional, de, ciencia, y, tecnologia]).
reconocimientos('Frankling Chang', ['Desarrollo', de, motor, de, plasma]).
reconocimientos('Clodomiro Picado', ['Suero', antiofidico]).
reconocimientos('Clodomiro Picado', ['Benemerito', de, la, patria]).
reconocimientos('Clodomiro Picado', penicilina).

extranjero('Frankling Chang').
extranjero('Clodomiro Picado').
extranjero('Claudia Poll').
extranjero('Pilar Cisneros').

altura('Carlos Ramos', pequenno).
altura('Keylor Navas', pequenno).
altura('Claudia Poll', alto).

cabello('Mauricio Hoffman', corto).
cabello('Carlos Ramos', corto).
cabello('Victor Carvajal', copete).

contextura('Mauricio Hoffman', musculoso).
contextura('Victor Carvajal', flaco).
contextura('Carlos Ramos', grueso).

tez('Joel Campbell', afrodescendiente).
tez('Claudia Poll', caucasica).

tatuajes('Mauricio Hoffman').

anteojos('Mauricio Hoffman').

lgbtiq('Victor Carvajal').

ojos('Mauricio Hoffman', claros).

personalidad('Carlos Ramos', risuenno).

caricatura('Rana de Kolbi').
caricatura('Gallo Gollo').
caricatura('Tren de Teletica').

clasificacion('Rana de Kolbi', anfibio).
clasificacion('Gallo Gollo',ave).
clasificacion('Tren de Teletica', vehiculo).

color('Rana de Kolbi', verde).
color('Gallo Gollo', amarillo).
color('Tren de Teletica', azul).



validez('y').

%%% Reglas

play:-
  question_animated;
  question_cientifico;
  question_presentador;
  question_futbolista;
  question_swimmer;
  question_comediante;
  deadend.

deadend:-
  write('No se puede adivinar su personaje').

% comediante
question_comediante:-
  write('Es su personaje un comediante?'),
  read(Respuesta),
  validez(Respuesta),
  comediante_positivo.

comediante_positivo:-
  persona(X),
  ocupacion(X, humorista),
  write(X).

% nadador
question_swimmer:-
  write('Es su personaje nadador?'),
  read(Respuesta),
  validez(Respuesta),
  swimmer_positivo.

swimmer_positivo:-
  persona(X),
  ocupacion(X, nadador),
  write(X).

%% Futbolistas
question_futbolista:-
  write('Es su personaje futbolista?'),
  read(Respuesta),
  validez(Respuesta),
  question_real.

question_real:-
  write('Jugó su personaje para el Real Madrid?'),
  read(Respuesta),
  validez(Respuesta),
  positivo_real;
  negativo_real.

positivo_real:-
  persona(X),
  ocupacion(X, futbolista),
  afiliacion(X, realMadrid),
  write(X).

negativo_real:-
  persona(X),
  ocupacion(X, futbolista),
  not(afiliacion(X, realMadrid)),
  write(X).

%% Cientificos
question_cientifico:-
  write('Es su personaje un cientifico?'),
  read(Respuesta),
  validez(Respuesta),
  question_universidad.

question_universidad:-
  write('Es su personaje perteneciente a una universidad publica?'),
  read(Respuesta),
  validez(Respuesta),
  universidad_positivo;
  universidad_negativo.

universidad_positivo:-
  write('Su personaje pertenece al TEC?'),
  read(Respuesta),
  validez(Respuesta),
  tec_positivo;
  tec_negativo.

tec_positivo:-
  persona(X),
  ocupacion(X, cientifico),
  afiliacion(X, tEC),
  write(X).

tec_negativo:-
  persona(X),
  ocupacion(X, cientifico),
  afiliacion(X, uCR),
  write(X).

universidad_negativo:-
  persona(X),
  ocupacion(X, cientifico),
  not(afiliacion(X, uCR)),
  not(afiliacion(X, tEC)),
  write(X).

%% Presentadores
question_presentador:-
  write('Es su personaje un presentador?'),
  read(Respuesta),
  validez(Respuesta),
  question_mujer.

question_mujer:-
  write('Es su personaje mujer?'),
  read(Respuesta),
  validez(Respuesta),
  mujer_positivo;
  question_lentes.

mujer_positivo:-
  persona(X),
  ocupacion(X, presentador),
  genero(X, femenino),
  write(X).

question_lentes:-
  write('Su personaje usa lentes?'),
  read(Respuesta),
  validez(Respuesta),
  lentes_positivo;
  lentes_negativo.

lentes_positivo:-
  persona(X),
  ocupacion(X, presentador),
  genero(X, masculino),
  anteojos(X),
  write(X).

lentes_negativo:-
  persona(X),
  ocupacion(X, presentador),
  not(anteojos(X)),
  write(X).

question_animated:-
  write('Es su personaje animado?'),
  read(Respuesta),
  validez(Respuesta),
  inter_animated
  .

inter_animated:-
  question_color;
  question_teletica;
  caricatura(X),
  color(X,verde),
  write(X).

question_teletica:-
  write('Su personaje pertenece a Teletica?'),
  read(Respuesta),
  validez(Respuesta),
  inter_teletica.

inter_teletica:-
  caricatura(X),
  afiliacion(X, teletica),
  write(X).

question_color:-
  write('Su personaje es amarillo?'),
  read(Respuesta),
  validez(Respuesta),
  inter_color
  .

inter_color:-
  caricatura(X),
  color(X, amarillo),
  write(X).
