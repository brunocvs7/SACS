CREATE DATABASE SIMULADO;

CREATE TABLE IDIOMA
(

id_idioma int not null auto_increment,
idioma varchar(20) not null,
PRIMARY KEY(id_idioma)

);

CREATE TABLE COR_PROVA
(
id_cor int not null auto_increment,

cor varchar(20) not null,

PRIMARY KEY (id_cor)
);


CREATE TABLE APLICADOR 
(
id_aplicador int not null auto_increment,
cpf_aplicador varchar(14) not null, 
nome_aplicador varchar(50) not null,

PRIMARY KEY (id_aplicador)

);

CREATE TABLE SALA
(
id_sala int not null auto_increment,
capacidade int unsigned not null, 
numero int unsigned not null, 
PRIMARY KEY (id_sala)
);

CREATE TABLE APLICACAO
(

id_



);

CREATE TABLE CANDIDATO
(

id_candidato int not null auto_increment,

nome varchar (50) not null,

cpf varchar (14) not null,





);