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
 VALUES(0, 'tyefen', 'okok', 'Tyefen');
 
 INSERT INTO DOCUMENT(idDoc, title, author, description)
 VALUES(doc_seq.nextval, 'Les Miserables', 'Victor Hugo', 'Un livre.');
 
 INSERT INTO DOCUMENT(idDoc, title, author, description)
 VALUES(doc_seq.nextval, 'Titanic', 'James Cameron', 'Un film.');
 
 INSERT INTO DOCUMENT(idDoc, title, author, description)
 VALUES(doc_seq.nextval, 'Pokemon Donjon Mystere DX', 'Spike Chunsoft', 'Un jeu');