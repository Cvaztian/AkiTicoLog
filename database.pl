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

lgbtiq+('Victor Carvajal').

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
