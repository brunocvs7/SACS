CREATE DATABASE simulado;

USE  simulado;

CREATE TABLE aplicador (
id_aplicador int unsigned not null, 
nome varchar(60) not null, 
cpf varchar(14) not null,
PRIMARY KEY(id_aplicador) 
);

CREATE TABLE candidato(
inscricao_id int  unsigned not null, 
nome varchar(60)  not null,
cpf varchar (14) not null, 
cor_prova varchar(10) not null,
idioma_prova varchar(10) not null,
nascimento date not null, 
data_aplicacao date not null,
sala varchar(10) not null,
fk_id_aplicador int unsigned not null,
FOREIGN KEY(fk_id_aplicador) REFERENCES aplicador (id_aplicador),

PRIMARY KEY(inscricao_id)

);







