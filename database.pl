consult(cvaz_inferencia).

personaje('Gallo gollo',[caricatura,f,a,f,amarillo,f]).
personaje('Rana de Kolbi',[caricatura,f,a,f,verde,f]).
personaje('Gallo gollo',[caricatura,f,gollo,f,amarillo,f]).
personaje('Rana de Kolbi',[caricatura,f,kolbi,f,verde,f]).
personaje('Tren de Teletica',[caricatura,f,teletica,f,f,f]).
personaje('Joel Campbell',[real,futbolista,clubLeon,f,f,f]).
personaje('Keylor Navas',[real,futbolista,realMadrid,f,f,f]).
personaje('Mauricio Hoffman',[real,presentador,f,hombre,f,si]).
personaje('Victor Carvajal',[real, presentador, f, hombre, f,nao]).
personaje('Clodomiro Picado',[real, cientifico, uCR, f, f,f]).
personaje('Ivan Vargas', [real, cientifico, tEC, f, f,f]).
personaje('Frankling Chang',[real, cientifico, nASA, f, f,f]).
personaje('Pilar Cisneros',[real, presentador, f, mujer, f,nao]).
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
  verificar_pj([Real,Ocup,Afil,Gen,Col,Len]), personaje(X, [Real,Ocup,Afil,Gen,Col,Len]), write('Su personaje es: '), write(X), nl, abort;
  q_anim([Real,Ocup,Afil,Gen,Col,Len]),
  q_ocup([Real,Ocup,Afil,Gen,Col,Len]),
  q_afil([Real,Ocup,Afil,Gen,Col,Len]),
  q_gen([Real,Ocup,Afil,Gen,Col,Len]),
  q_col([Real,Ocup,Afil,Gen,Col,Len]),
  q_lentes([Real,Ocup,Afil,Gen,Col,Len]),
  valid_all([Real,Ocup,Afil,Gen,Col,Len]).

valid_all([Real, Ocup, Afil, Gen, Col, Len]):-
  valid(real, Real), valid(ocupacion, Ocup), valid(afiliacion, Afil),
  valid(genero, Gen), valid(lentes, Len), orch([Real, Ocup, Afil, Gen, Col, Len]).

verificar_pj([Real,Ocup,Afil,Gen,Col,Len]):-
  Real==caricatura,(valid(color,Col);Afil==teletica),valid(afiliacion, Afil);
  Ocup==cientifico, valid(afiliacion, Afil);
  Ocup==presentador, valid(genero, Gen), valid(lentes, Lentes);
  Ocup==futbolista, valid(afiliacion, Afil);
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
  not(Ocup==presentador);
  write('Su personaje es hombre?'), nl,
  bNF([Real, Ocup, Afil, Gen, Col, Len], gen).

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

sacar([X],R):- R=X.
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
