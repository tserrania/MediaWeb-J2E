DROP TABLE UTILISATEUR CASCADE CONSTRAINTS;
DROP TABLE DOCUMENT CASCADE CONSTRAINTS;
DROP SEQUENCE doc_seq;

CREATE TABLE UTILISATEUR (
	idUser INTEGER CONSTRAINT pk_utilisateur PRIMARY KEY,
	login VARCHAR2(30),
	password VARCHAR2(30),
	name VARCHAR2(30),
	bibliothecaire INTEGER DEFAULT 0
);

CREATE TABLE DOCUMENT (
	idDoc INTEGER CONSTRAINT pk_document PRIMARY KEY,
	typeDoc INTEGER,
	title VARCHAR2(30),
	author VARCHAR2(30),
	description VARCHAR2(255),
	idUser INTEGER,
	emprunte INTEGER DEFAULT 0
);

ALTER TABLE DOCUMENT
ADD CONSTRAINT fk_utilisateur FOREIGN KEY (idUser) REFERENCES UTILISATEUR(idUser);

CREATE SEQUENCE doc_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 INSERT INTO UTILISATEUR(idUser, login, password, name)
 VALUES(1, 'tyefen', 'user', 'Tyefen');
 INSERT INTO UTILISATEUR(idUser, login, password, name)
 VALUES(2, 'aleryc', 'user', 'Aleryc');
 INSERT INTO UTILISATEUR(idUser, login, password, name, bibliothecaire)
 VALUES(3, 'brette', 'biblio', 'Brette', 1);
 
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 0, 'Les Miserables', 'Victor Hugo', 'Un livre.');
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 0, 'Mathilda', 'Roal Dahl', 'Un autre livre.');
 
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 1, 'Titanic', 'James Cameron', 'Un film.');
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 1, '???', '???', 'Un film inconnu.');
 
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 2, 'Steam Sweat and Struggle', 'PJS4', 'Un jeu.');
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 2, 'Animal Crossing: New Horizons', 'Nintendo', 'Un autre jeu.');
 INSERT INTO DOCUMENT(idDoc, typeDoc, title, author, description)
 VALUES(doc_seq.nextval, 2, 'Pokemon Donjon Mystere DX', 'Spike Chunsoft', 'Encore un autre jeu.');

COMMIT
/