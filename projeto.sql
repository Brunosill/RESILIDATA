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
-- OBS: Retirei a coluna id_módulo porque o módulo depende do curso e não o inverso. No módulo, referenciei o id_curso
-- OBS2: Acredito que ementa não seja necessário.

INSERT INTO curso (id_curso, nome,  data_inicio, data_enceramento, status, ementa, carga_horaria, turno, monitor_soft, monitor_tech)
VALUES 
(1,  'WebDev Full Stack', '2019-02-06', '2019-08-06', 'Concluído'   , 'EmentaDev', 672, 'Vespertino', ), 
(2,  'Data Analytics'   , '2019-04-17', '2019-10-17', 'Concluído'   , 'EmentaDad', 650, 'Vespertino', ),
(3,  'WebDev Full Stack', '2019-06-22', '2019-12-20', 'Concluído'   , 'EmentaDev', 696, 'Noturno'   , ),
(4,  'Data Analytics'   , '2019-09-05', '2020-03-05', 'Concluído'   , 'EmentaDad', 579, 'Noturno'   , ),
(5,  'WebDev Full Stack', '2019-12-11', '2020-05-12', 'Concluído'   , 'EmentaDev', 541, 'Noturno'   , ),
(6,  'Data Analytics'   , '2020-03-15', '2020-09-18', 'Concluído'   , 'EmentaDad', 563, 'Vespertino', ),
(7,  'WebDev Full Stack', '2020-06-24', '2020-12-28', 'Concluído'   , 'EmentaDev', 600, 'Noturno'   , ),
(8,  'Data Analytics'   , '2020-08-20', '2021-02-25', 'Concluído'   , 'EmentaDad', 609, 'Noturno'   , ),
(9,  'WebDev Full Stack', '2020-10-03', '2021-04-07', 'Concluído'   , 'EmentaDev', 591, 'Noturno'   , ),
(10, 'Data Analytics'   , '2020-12-18', '2021-05-18', 'Concluído'   , 'EmentaDad', 581, 'Vespertino', ),
(11, 'WebDev Full Stack', '2021-02-08', '2021-08-08', 'Concluído'   , 'EmentaDev', 656, 'Noturno'   , ),
(12, 'Data Analytics'   , '2021-05-26', '2021-11-28', 'Concluído'   , 'EmentaDad', 650, 'Noturno'   , ),
(13, 'WebDev Full Stack', '2021-09-26', '2022-03-30', 'Concluído'   , 'EmentaDev', 660, 'Vespertino', ),
(14, 'Data Analytics'   , '2021-11-14', '2022-04-18', 'Concluído'   , 'EmentaDad', 615, 'Vespertino', ),
(15, 'WebDev Full Stack', '2021-12-20', '2022-05-20', 'Concluído'   , 'EmentaDev', 632, 'Noturno'   , ),
(16, 'Data Analytics'   , '2022-01-30', '2022-08-01', 'Concluído'   , 'EmentaDad', 678, 'Noturno'   , ),
(17, 'Data Analytics'   , '2022-03-02', '2022-09-05', 'Em Andamento', 'EmentaDad', 657, 'Vespertino', ),
(18, 'WebDev Full Stack', '2022-04-22', '2022-10-31', 'Em andamento', 'EmentaDev', 604, 'Noturno'   , ),
(19, 'Data Analytics'   , '2022-05-16', '2022-11-18', 'Em andamento', 'EmentaDev', 682, 'Vespertino', ),
(20, 'WebDev Full Stack', '2022-08-29', '2023-03-02', 'Em andamento', 'EmentaDad', 650, 'Noturno'   , ),
(21, 'Data Anaçytics'   , '2023-01-17', '2023-07-18', 'Programado'  , 'EmentaDev', 650, 'Noturno'   , );


-- Popular tabela matricula:
-- Popular tabela modulo:
-- Popular tabela facilitador:

