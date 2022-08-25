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
  "id_curso" int
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

ALTER TABLE "modulo" ADD FORIGN KEY ("id_modulo") REFERENCES ("id_curso")

-- Popular tabelas:

-- Popular tabela aluno:
- OBS: não consegui testar essa inserção pois ao rodar a criaçã das tabelas geraram varios erros

INSERT INTO Aluno (id_aluno,cpf,nome,email,cep,cidade,estado,celular,data_nacimento,escolaridade,genero,etnia,curso_id,status_empregabilidade)
VALUES
('1','624.783.240-08','Carolina Márcia Sarah Jesus','carolina.jesus@outlook.com','29500970','Alegre','ES','(98)98319-4520','12/07/1990','Ensino Médio Completo','Feminino','negro','1','Em busca de emprego'),
('2','134.957.110-58','Sebastiana Isis Carvalho','sebastiana.carvalho@outlook.com','25251043','Duque de Caxias','RJ','(68)99648-6921','12/07/1990','Ensino Médio Completo','Não-binário','negro','2','Empregado'),
('3','319.725.970-00','Francisca Yasmin Rafaela Bernardes','francisca.bernardes@outlook.com','21843970','Rio de Janeiro','RJ','(61)97279-8964','12/07/1990','Ensino Médio Incompleto','Feminino','branco','3','Empregado'),
('4','376.133.930-54','Osvaldo Diogo Corte Real','osvaldo.real@outlook.com','68702180','Capanema','PA','(32)97936-3914','12/07/1990','Ensino Superior Completo','Masculino','indigena','4','Em busca de emprego'),
('5','548.636.900-02','Sarah Betina Eloá Galvão','sarah.galvao@outlook.com','89282545','São Bento do Sul','SC','(68)97524-4347','12/07/1990','Ensino Superior Completo','Feminino','negro','5','Em busca de emprego'),
('6','031.515.740-25','Bernardo Bento Nascimento','bernado.nascimento@outlook.com','29101360','Vila Velha','ES','(96)98769-7425','12/07/1990','Ensino Superiro Incompleto','Não-binário','branco','6','Em busca de emprego'),
('7','040.893.270-83','Manoel Benício Jorge Campos','manoel.campos@outlook.com','41307230','Salvador','BA','(84)98205-4547','12/07/1990','Ensino Médio Completo','Masculino','branco','7','Empregado'),
('8','734.806.390-03','Milena Aurora Tatiane Melo','milena.melo@outlook.com','69098600','Manaus','AM','(66)99177-2628','12/07/1990','Ensino Fundamental Completo','Masculino','branco','8','Em busca de emprego'),
('9','243.520.230-00','Leandro Jorge Thomas Rocha','leandro.rocha@outlook.com','29500970','Alegre','ES','(93)96739-0536','12/07/1990','Ensino Médio Completo','Feminino','negro','9','Em busca de emprego'),
('10','544.528.720-34','Noah Elias Costa','noah.costa@outlook.com','59124010','Natal','RN','(11)98117-1891','12/07/1990','Ensino Médio Completo','Masculino','negro','10','Em busca de emprego'),
('11','335.833.950-50','Lucas Fábio da Paz','lucas.paz@outlook.com','13275650','Valinhos','SP','(77)98587-7351','12/07/1990','Ensino Médio Completo','Não-binário','branco','11','Em busca de emprego'),
('12','009.344.610-15','Elaine Silvana Jaqueline Santos','elaine.santos@outlook.com','17065411','Bauru','SP','(92)98260-1704','12/07/1990','Ensino Médio Completo','Feminino','negro','12','Em busca de emprego'),
('13','098.660.450-05','Fernanda Sebastiana Nogueira','fernanda.nogueira@outlook.com','12223400','São José dos Campos','SP','(96)96707-4750','12/07/1990','Ensino Médio Completo','Feminino','negro','13','Em busca de emprego'),
('14','738.985.310-74','Isabelly Carla da Luz','isabelly.luz@outlook.com','29500970','Alegre','ES','(24)98623-6788','12/07/1990','Ensino Médio Completo','Feminino','indigena','14','Empregado'),
('15','642.993.950-26','Gabrielly Antônia Rafaela da Mata','gabrielly.mata@outlook.com','21843970','Rio de Janeiro','RJ','(91)97146-9961','12/07/1990','Ensino Médio Incompleto','Feminino','negro','15','Em busca de emprego'),
('16','508.776.320-06','Hadassa Analu Stella Pereira','hadassa.perreira@outlook.com','68702180','Capanema','PA','(82)98752-3446','12/07/1990','Ensino Superior Completo','Feminino','branco','16','Em busca de emprego'),
('17','564.098.550-01','Filipe Márcio Nathan Gonçalves','filipe.goncalves@outlook.com','89282545','São Bento do Sul','SC','(84)99984-2612','12/07/1990','Ensino Médio Completo','Masculino','branco','17','Em busca de emprego'),
('18','054.596.290-04','Sarah Alana Freitas','sarah.freitas@outlook.com','29101360','Vila Velha','ES','(67)99813-1215','12/07/1990','Ensino Médio Completo','Feminino','branco','18','Em busca de emprego'),
('19','336.199.830-11','Anthony Manuel Barbosa','anthony.barbosa@outlook.com','78035565','Cuiabá','MT','(79)98880-7032','12/07/1990','Ensino Médio Completo','Masculino','negro','19','Em busca de emprego'),
('20','624.783.240-08',João Kauê Porto','joao.porto@outlook.com','76829312','Porto Velho','1','(62)98957-7116','12/07/1990','Ensino Médio Completo','Masculino','negro','20','Em busca de emprego');

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

