consult(cvaz_inferencia).

personaje('Gallo gollo',[caricatura,_,gollo,_,amarillo,_]).
personaje('Rana de Kolbi',[caricatura,_,kolbi,_,verde,_]).
personaje('Gallo gollo',[caricatura,_,_,_,amarillo,_]).
personaje('Rana de Kolbi',[caricatura,_,_,_,verde,_]).
personaje('Tren de Teletica',[caricatura,f,teletica,_,_,_]).
personaje('Joel Campbell',[real,futbolista,_,_,negro,_]).
personaje('Joel Campbell', [real, futbolista, clubLeon, _, _, _]).
personaje('Keylor Navas',[real,futbolista,realMadrid,_,_,_]).
personaje('Mauricio Hoffman',[real,presentador,_,hombre,_,si]).
personaje('Victor Carvajal',[real, presentador, _, hombre, _,nao]).
personaje('Clodomiro Picado',[real, cientifico, uCR, _, _,_]).
personaje('Ivan Vargas', [real, cientifico, tEC, _, _,_]).
personaje('Frankling Chang',[real, cientifico, nASA, _, _,_]).
personaje('Pilar Cisneros',[real, presentador, _, mujer, _,_]).
personaje('Claudia Poll',[real, nadador, _, _, _, _]).
personaje('Carlos Ramos',[real, humorista, _, hombre, _, _]).
personaje('Natalia Monge',[real, humorista, _,mujer, _, _]).
personaje('Sindy Chaves Noguera',[real, cientifico, _, mujer, _, _]).


validez('y').

% Colores validos
valid(color, amarillo).
valid(color, azul).
valid(color, verde).
valid(color, negro).

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
valid(afiliacion, a).
valid(afiliacion, p).

% Generos validos
valid(genero, hombre).
valid(genero, mujer).

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
  bNF([Real, Ocup, Afil, Gen, Col, Len], real).

orch([Real,Ocup,Afil,Gen,Col,Len]):- % Funcion orquestadora
  personaje(X, [Real,Ocup,Afil,Gen,Col,Len]), write('Su personaje es: '), write(X), nl, abort;
  q_anim([Real,Ocup,Afil,Gen,Col,Len]),
  q_ocup([Real,Ocup,Afil,Gen,Col,Len]),
  q_afil([Real,Ocup,Afil,Gen,Col,Len]),
  q_gen([Real,Ocup,Afil,Gen,Col,Len]),
  q_col([Real,Ocup,Afil,Gen,Col,Len]),
  q_lentes([Real,Ocup,Afil,Gen,Col,Len]),
  verificar_pj([Real,Ocup,Afil,Gen,Col,Len]).

valid_all([Real, Ocup, Afil, Gen, Col, Len]):-
  valid(real, Real), valid(ocupacion, Ocup), valid(afiliacion, Afil),
  valid(genero, Gen), valid(lentes, Len), orch([Real, Ocup, Afil, Gen, Col, Len]).

verificar_pj([Real,Ocup,Afil,Gen,Col,Len]):-
  Real==caricatura,(valid(color,Col);Afil==teletica),valid(afiliacion, Afil);
  Ocup==cientifico, valid(afiliacion, Afil);
  Ocup==presentador, valid(genero, Gen), valid(lentes, Lentes);
  Ocup==futbolista, (valid(afiliacion, Afil); valid(color, Col));
  Ocup==nadador;
  Ocup==humorista.

q_ocup([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(ocupacion, Ocup);
  Real==caricatura;
  write('Cual es la ocupacion de su personaje?'),nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len], ocup).

% Preguntas de afiliacion
q_afil([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(afiliacion, Afil), not(Afil==p);
  Real==caricatura, q_afil_anim([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  (Ocup==cientifico, Afil==f), q_afil_cient([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  Afil==p, q_afil_cient2([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  Ocup==futbolista, q_afil_futbol([Real,Ocup,Afil,Gen,Col,Len]), orch([Real,Ocup,Afil,Gen,Col,Len]);
  Ocup==presentador;Ocup==nadador;Ocup==humorista.

q_afil_cient([Real,Ocup,Afil,Gen,Col,Len]):- % More work required here
  write('Su personaje es parte de una universidad publica?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len], afilcient).

q_afil_cient2([Real,Ocup,Afil,Gen,Col,Len]):-
  write('su personaje es parte de la UCR?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len], afilcient2).

q_afil_anim([Real,Ocup,Afil,Gen,Col,Len]):-
  write('Su personaje trabaja es de Teletica?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len], afilanim).

q_afil_futbol([Real,Ocup,Afil,Gen,Col,Len]):-
  write('Su personaje jugó para el Real Madrid?'), nl,
  bNF([Real,Ocup,Afil,Gen,Col,Len], afilfut).

q_gen([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(genero, Gen);
  not(Ocup==presentador; Ocup==humorista; Ocup==cientifico);
  write('Su personaje es hombre?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len], gen).

q_col_fut([Real, Ocup, Afil, Gen, Col, Len]):-
  valid(color, Col);
  not(Ocup==futbolista);
  write('Su personaje es de color?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len], col_fut).

q_col([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(color, Col);
  not(Real==caricatura);
  write('Su personaje es amarillo?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len], col).

q_lentes([Real,Ocup,Afil,Gen,Col,Len]):-
  valid(lentes, Len);
  not(Ocup==presentador);
  write('Su personaje usa lentes?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len], len).

sacar([X],X).
sacar(X,X).
sustituir(real, Valor, X):- Valor==real, X=si.

% Regla que agrega un Valor a la primera lista segun a que caracteristica pertenezca
add_lista([Real, Ocup, Afil, Gen, Col, Len], Valor, [Real2, Ocup2, Afil2, Gen2, Col2, Len2]):-
  Real==f,valid(real, Valor),Real2 = Valor, Ocup2=Ocup, Afil2=Afil, Gen2=Gen, Col2=Col, Len2=Len;
  Ocup==f, valid(ocupacion, Valor), Real2=Real, Ocup2=Valor, Afil2=Afil, Gen2=Gen, Col2=Col, Len2=Len;
  (Afil==f;Afil==p), valid(afiliacion, Valor), Real2=Real, Ocup2=Ocup, Afil2=Valor, Gen2=Gen, Col2=Col, Len2=Len;
  Gen==f, valid(genero, Valor), Real2=Real, Ocup2=Ocup, Afil2=Afil, Gen2=Valor, Col2=Col, Len2=Len;
  Col==f, valid(color, Valor), Real2=Real, Ocup2=Ocup, Afil2=Afil, Gen2=Gen, Col2=Valor, Len2=Len;
  Len==f, valid(lentes, Valor), Real2=Real, Ocup2=Ocup, Afil2=Afil, Gen2=Gen, Col2=Col, Len2=Valor.
%BNF
bNF(Lista, Tipo):-
  answer(X, Tipo),
  sacar(X, R),
  add_lista(Lista, R, NuevaLista),
  orch(NuevaLista).
