consult(cvaz_inferencia).
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

personaje('Gallo gollo',[caricatura,f,gollo,f,amarillo,f]).
personaje('Rana de Kolbi',[caricatura,f,kolbi,f,verde,f]).
personaje('Tren de Teletica',[caricatura,f,teletica,azul,f]).
personaje('Joel Campbell',[real,futbolista,clubLeon,f,f,f]).
personaje('Keylor Navas',[real,futbolista,realMadrid,f,f,f]).
personaje('Mauricio Hoffman',[real,presentador,teletica,masculino,f,si]).
personaje('Victor Carvajal',[real, presentador, teletica, masculino, f,nao]).
personaje('Clodomiro Picado',[real, cientifico, uCR, f, f,f]).
personaje('Ivan Vargas', [real, cientifico, tEC, f, f,f]).
personaje('Frankling Chang',[real, cientifico, nASA, f, f,f]).
personaje('Pilar Cisneros',[real, presentador, teletica, femenino, f,nao]).
personaje('Claudia Poll',[real, nadador, f, f, f, f]).
personaje('Carlos Ramos',[real, humorista, f, f, f, f]).


validez('y').

% Colores validos
valid(color, amarillo).
valid(color, azul).
valid(color, verde).

% Ocupaciones validas
valid(ocupacion, presentador).
valid(ocupacion, futbolista).
valid(ocupacion, nadador).
valid(ocupacion, humorista).
valid(ocupacion, cientifico).

% Afiliaciones validas
valid(afiliacion, teletica).
valid(afiliacion, realMadrid).
valid(afiliacion, clubLeon).
valid(afiliacion, nASA).
valid(afiliacion, tEC).
valid(afiliacion, uCR).
valid(afiliacion, gollo).
valid(afiliacion, kolbi).

% Generos validos
valid(genero, masculino).
valid(genero, femenino).

% Real validos
valid(real, real).
valid(real, caricatura).

% Lentes validos
valid(lentes, si).
valid(lentes, nao).

%%% Reglas

play:- orch([f,f,f,f,f,f]).

q_anim([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(real, Real);
  write('Es su personaje real?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len]).

orch([Real,Ocup,Afil,Gen,Col,Len]):- % Funcion orquestadora
  verificar_pj([Real,Ocup,Afil,Gen,Col,Len]), personaje(X, [Real,Ocup,Afil,Gen,Col,Len]), write('Su personaje es: '), write(X), nl, abort;
  q_anim([Real,Ocup,Afil,Gen,Col,Len]),
  q_ocup([Real,Ocup,Afil,Gen,Col,Len]),
  q_afil([Real,Ocup,Afil,Gen,Col,Len]),
  q_gen([Real,Ocup,Afil,Gen,Col,Len]),
  q_col([Real,Ocup,Afil,Gen,Col,Len]),
  valid_all([Real,Ocup,Afil,Gen,Col,Len]).

verificar_pj([Real,Ocup,Afil,Gen,Col,Len]):-
  Real==caricatura,valid(color,Col),valid(afiliacion, Afil);
  Ocup==cientifico, valid(afiliacion, Afil);
  Ocup==presentador, valid(genero, Gen), valid(lentes, Lentes);
  Ocup==futbolista, valid(afiliacion, Afil);
  Ocup==nadador;
  Ocup==humorista.

q_ocup([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(ocupacion, Ocup);
  Real==caricatura;
  write('Cual es la ocupacion de su personaje?'),nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len]).

% Preguntas de afiliacion
q_afil([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(afiliacion, Afil);
  Real==caricatura, q_afil_anim([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  Ocup==cientifico, q_afil_cient([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  Ocup==futbolista, q_afil_futbol([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  Ocup==presentador;Ocup==nadador;Ocup==humorista.

q_afil_cient([Real,Ocup,Afil,Gen,Col,Len]):- % More work required here
  write('Su personaje es parte de una universidad publica?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len]).

q_afil_anim([Real,Ocup,Afil,Gen,Col,Len]):-
  write('Su personaje trabaja es de Teletica?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len]).

q_afil_futbol([Real,Ocup,Afil,Gen,Col,Len]):-
  write('Su personaje jugó para el Real Madrid?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len]).

q_genero([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(genero, Gen);
  not(Ocup==presentador);
  write('Su personaje es hombre?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len]).

q_color([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(color, Col);
  not(Real==caricatura);
  write('Su personaje es amarillo?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len]).

q_lentes([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(lentes, Len);
  not(Ocup==presentador);
  write('Su personaje usa lentes?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len]).

sacar([X],R):- R=X.
sustituir(real, Valor, X):- Valor==real, X=si.

% Regla que agrega un Valor a la primera lista segun a que caracteristica pertenezca
add_lista([Real, Ocup, Afil, Gen, Col, Len], Valor, [Real2, Ocup2, Afil2, Gen2, Col2, Len2]):-
  Real==f,valid(real, Valor),Real2 = Valor, Ocup2=f, Afil2=f, Gen2=f, Col2=f, Len2=f;
  Ocup==f, valid(ocupacion, Valor), Real2=Real, Ocup2=Valor, Afil2=f, Gen2=f, Col2=f, Len2=f;
  Afil==f, valid(afiliacion, Valor), Real2=Real, Ocup2=Ocup, Afil2=Valor, Gen2=f, Col2=f, Len2=f;
  Gen==f, valid(afiliacion, Valor), Real2=Real, Ocup2=Ocup, Afil2=Afil, Gen2=Valor, Col2=f, Len2=f;
  Col==f, valid(color, Valor), Real2=Real, Ocup2=Ocup, Afil2=Afil, Gen2=Gen, Col2=Valor, Len2=f;
  Len==f, valid(color, Valor), Real2=Real, Ocup2=Ocup, Afil2=Afil, Gen2=Gen, Col2=Col, Len2=Valor.
%BNF
bNF(Lista):-
  answer(X),
  sacar(X, R),
  add_lista(Lista, R, NuevaLista),
  orch(NuevaLista).
