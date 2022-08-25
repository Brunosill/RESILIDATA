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

