-- Criar tabela aluno:

CREATE TABLE "aluno" (
  "id_aluno" int PRIMARY KEY,
  "cpf" varchar(14),
  "nome" varcahr(50),
  "email" varchar(30),
  "cep" varchar(10),
  "cidade" varchar(30),
  "estado" varchar(2),
  "celular" varchar(14),
  "data_nacimento" datatime,
  "escolaridade" varchar(20),
  "genero" vrachar(10),
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
  "id_modulo" int,
  "data_inicio" datatime,
  "data_enceramento" datatime,
  "status" varchar(20),
  "ementa" varchar(300),
  "carga_horaria" int,
  "turno" varchar(30),
  "monitor_soft" varchar(50),
  "monitor_tech" varchar(50)
);

-- Criar tabela módulos:

CREATE TABLE "modulo" (
  "id_modulo" int PRIMARY KEY,
  "nivel" int,
  "ementa" varchar(150),
  "facilitador_soft" varchar(150),
  "facilitador_tech" varchar(150),
  "to_dos" int,
  "carga_horaria" int,
  "projeto_modulo" int,
  "status" varchar(20)
);

-- Criar tabela facilidator: 

CREATE TABLE "facilidator" (
  "id_facilitador" int PRIMARY KEY,
  "nome" varchar(50),
  "cpf" varchar(14),
  "area" varchar(50)
);

-- Crirar relacionamentos:

ALTER TABLE "modulo" ADD FOREIGN KEY ("id_modulo") REFERENCES "curso" ("id_modulo");

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_soft") REFERENCES "facilidator" ("id_facilitador");

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_tech") REFERENCES "facilidator" ("id_facilitador");

ALTER TABLE "aluno" ADD FOREIGN KEY ("id_aluno") REFERENCES "matricula" ("id_aluno");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "curso" ADD FOREIGN KEY ("id_modulo") REFERENCES "curso" ("id_curso");


-- Popular tabelas:

-- Popular tabela aluno:
-- Popular tabela curso:
-- Popular tabela matricula:
-- Popular tabela modulo:
-- Popular tabela facilitador:

