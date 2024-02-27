
/*  Pedro Mattos de Melo Rocha 
	PT3025381
*/

create database consultorio

use consultorio

create table pessoas (
id int not null primary key identity,
data_nascimento date,
genero varchar (10),
estado_civil varchar (20),
rg varchar (10)
);

create table enderecos (
id int not null identity,
id_pessoa int not null,
logradouro varchar(50),
numero varchar(10),
cep varchar (9),
bairro varchar (50),
cidade varchar (50),
estado varchar (50),
primary key (id, id_pessoa),
foreign key (id_pessoa) references pessoas (id),
);

create table telefones(
id_pessoa int not null,
ddd varchar (3),
telefone varchar(9),
primary key (id_pessoa, ddd, telefone),
foreign key (id_pessoa) references pessoas (id)
);

create table pacientes (
id_pessoa int not null primary key,
convenio varchar (50),
foreign key (id_pessoa) references pessoas (id)
);

create table medicos (
id_pessoa int not null primary key,
crm varchar(10),
foreign key (id_pessoa) references pessoas(id),
);


create table consultas (
id int not null primary key identity,
data date,
diagnostico varchar(200),
id_medico int not null, 
id_paciente int not null
foreign key (id_medico) references medicos (id_pessoa),
foreign key (id_paciente) references pacientes(id_pessoa),
);

create table exames (
id int not null primary key identity,
id_consulta int not null,
data datetime not null,
exame varchar(50),
foreign key (id_consulta) references consultas(id)
);


insert into pessoas values (getDate(), 'Masculino', 'Solteiro', 568475962);
insert into pessoas values (getDate(), 'Masculino', 'Casado', 896575421);
insert into pessoas values (getDate(), 'Feminino', 'Casado', 796584238);
insert into pessoas values (getDate(), 'Masculino', 'Solteiro', 158496325);
insert into pessoas values (getDate(), 'Feminino', 'Solteiro', 786598300);


insert into enderecos values (1, 'Rua Arcelino Freire',123,12345678, 'Monte Belo', 'Sao Paulo', 'Sao Paulo');
insert into enderecos values (2, 'Av, Oscar Freire',1422,89012345, 'Jardins', 'Sao Paulo', 'Sao Paulo');
insert into enderecos values (3, 'Rua Santo Elias',85,84596321, 'Rio Pequeno', 'Sao Paulo', 'Sao Paulo');
insert into enderecos values (4, 'Rua Nao Gostuei',258,18695428, 'Asmei', 'Sao Paulo', 'Sao Paulo');
insert into enderecos values (5, 'Av Lastin Brito',788,13658741, 'Rio Grande', 'Sao Paulo', 'Sao Paulo');

insert into telefones values (1, 11, 945263748);
insert into telefones values (2, 11, 984596324);
insert into telefones values (3, 11, 915485632);
insert into telefones values (4, 11, 945986232);
insert into telefones values (5, 11, 945236984);

insert into pacientes values (1, 'Convenio 1');
insert into pacientes values (2, 'Convenio 2');
insert into pacientes values (3, 'Convenio 3');
insert into pacientes values (4, 'Convenio 4');
insert into pacientes values (5, 'Convenio 5');

insert into medicos values (1, 'Crm0');
insert into medicos values (2, 'Crm1');
insert into medicos values (3, 'Crm2');
insert into medicos values (4, 'Crm3');
insert into medicos values (5, 'Crm4');

insert into consultas values (getDate(), 'Cancer', 1, 1);
insert into consultas values (getDate(), 'Gastrite', 2, 2);
insert into consultas values (getDate(), 'Gripe', 3, 3);
insert into consultas values (getDate(), 'Dengue', 4, 4);
insert into consultas values (getDate(), 'Covid19', 5, 5);

insert into exames values (1, getDate(), 'Tumografia');
insert into exames values (2, getDate(), 'Endoscopia');
insert into exames values (3, getDate(), 'Teste de gripe');
insert into exames values (4, getDate(), 'Teste de dengue');
insert into exames values (5, getDate(), 'Teste de covid');

select * from pessoas;
select * from enderecos;
select * from telefones;
select * from pacientes;
select * from medicos;
select * from consultas;
select * from exames;

ALTER TABLE pessoas ADD nome varchar(20)

UPDATE pessoas
SET nome = 'Valter'
Where id = 1;

UPDATE pessoas
SET nome = 'Joao'
Where id = 2;

UPDATE pessoas
SET nome = 'Julia'
Where id = 3;

UPDATE pessoas
SET nome = 'Igor'
Where id = 4;

UPDATE pessoas
SET nome = 'Maria'
Where id = 5;

SELECT * from consultas WHERE id_medico = 3

SELECT * from exames WHERE id_consulta = 3

SELECT * from telefones WHERE id_pessoa = 3


SELECT pessoas.*, pacientes.*
FROM pessoas
JOIN pacientes ON pessoas.id = pacientes.id_pessoa;

SELECT pessoas.*, medicos.*
FROM pessoas
JOIN medicos ON pessoas.id = medicos.id_pessoa;