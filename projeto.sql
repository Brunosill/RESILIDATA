-- Criar tabela aluno:

CREATE TABLE "aluno" (
  "id_aluno" int PRIMARY KEY,
  "cpf" varchar(14),
  "nome" varchar(50),
  "email" varchar(30),
  "cep" varchar(10),
  "cidade" varchar(30),
  "estado" varchar(2),
  "celular" varchar(14),
  "data_nacimento" date,
  "escolaridade" varchar(20),
  "genero" varchar(10),
  "etnia" varchar(10),
  "curso_id" int,
  "status_empregabilidade" varchar(30)
);

-- Criar tabela matricula:

CREATE TABLE "matricula" (
  "id_aluno" int,
  "id_curso" int,
  "status" varchar(30)
);

-- Criar tabela curso:

CREATE TABLE "curso" (
  "id_curso" int PRIMARY KEY,
  "nome" varchar(50),
  "data_inicio" date,
  "data_enceramento" date,
  "status" varchar(20),
  "ementa" varchar(300),
  "carga_horaria" int,
  "turno" varchar(30),
  "monitor_soft" int,
  "monitor_tech" int
);

-- Criar tabela módulos:

CREATE TABLE "modulo" (
  "id_modulo" int PRIMARY KEY,
  "id_curso" int,
  "nivel" int,
  "ementa" varchar(150),
  "facilitador_soft" int,
  "facilitador_tech" int,
  "to_dos" int,
  "carga_horaria" int,
  "projeto_modulo" int,
  "status" varchar(20)
);

-- Criar tabela facilitador: 

CREATE TABLE "facilitador" (
  "id_facilitador" int PRIMARY KEY,
  "nome" varchar(50),
  "cpf" varchar(14),
  "area" varchar(50)
);

-- Crirar relacionamentos:


ALTER TABLE "modulo" ADD FOREIGN KEY (facilitador_soft) REFERENCES facilitador ("id_facilitador");

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_tech") REFERENCES "facilitador" ("id_facilitador");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_aluno") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "modulo" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");


-- Popular tabelas:

-- Popular tabela aluno:
-- Popular tabela curso:
-- Popular tabela matricula:
-- Popular tabela modulo:
-- Popular tabela facilitador:

INSERT INTO facilitador (id_facilitador,nome,cpf,area)
VALUES
  (1,'Hunter Blair','439.208.132-14','tech'),
  (2,'Cedric Payne','675.635.338-87','soft'),
  (3,'Sydnee Lester','328.121.498-02','tech'),
  (4,'Ethan Pearson','923.201.546-47','soft'),
  (5,'Quemby Mendez','854.330.578-60','tech'),
  (6,'Zachery Reeves','193.831.932-18','tech'),
  (7,'Adara Koch','528.635.334-85','tech'),
  (8,'Patience Bender','217.440.397-66','soft'),
  (9,'Callum Barber','351.461.900-31','tech'),
  (10,'Lyle Carroll','551.133.856-88','tech');