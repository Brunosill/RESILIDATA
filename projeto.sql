----------------------------------------------------------------- CRIANDO TABELAS---------------------------------------------------------------------------------

-- Criar tabela aluno:

CREATE TABLE "aluno" (
  "id_aluno" serial PRIMARY KEY,
  "cpf" varchar(14),
  "nome" varchar(50),
  "email" varchar(50),
  "cep" varchar(9),
  "cidade" varchar(50),
  "estado" varchar(2),
  "celular" varchar(14),
  "data_nacimento" date,
  "escolaridade" varchar(50),
  "genero" varchar(20),
  "etnia" varchar(20),
  "status_empregabilidade" varchar(50)
);

-- Criar tabela matricula:

CREATE TABLE "matricula" (
  "id_matricula" serial primary key,
  "id_aluno" int,
  "id_curso" int,
  "status" varchar(50)
);


-- Criar tabela curso:

CREATE TABLE "curso" (
  "id_curso" serial PRIMARY KEY,
  "nome" varchar(50),
  "data_inicio" date,
  "data_enceramento" date,
  "status" varchar(50),
  "carga_horaria" int,
  "turno" varchar(30)
);

-- Criar tabela módulo:

CREATE TABLE "modulo" (
  "id_modulo" serial PRIMARY KEY,
  "id_curso" int,
  "nivel" varchar(2),
  "ementa" varchar(250),
  "facilitador_soft" int,
  "facilitador_tech" int,
  "carga_horaria" int,
  "status_modulo" varchar(20)
);

-- Criar tabela facilitador: 

CREATE TABLE "facilitador" (
  "id_facilitador" serial PRIMARY KEY,
  "nome" varchar(50),
  "cpf" varchar(14),
  "area" varchar(50)
);

-- Criar tabela projeto final:

CREATE TABLE "projeto_final" (
  "id_matricula" int,
  "id_modulo" int,
  "nota_soft" int,
  "nota_tech" int 
);

---------------------------------------------CRIANDO RELACIONAMENTOS-------------------------------------------------------------------------------------------------

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_soft") REFERENCES "facilitador" ("id_facilitador");

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_tech") REFERENCES "facilitador" ("id_facilitador");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_aluno") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "modulo" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "projeto_final" ADD  FOREIGN KEY ("id_matricula") REFERENCES "matricula" ("id_matricula");

ALTER TABLE "projeto_final" ADD  FOREIGN KEY ("id_modulo") REFERENCES "modulo" ("id_modulo");

--------------------------------------------------------- POPULANDO TABELAS-----------------------------------------------------------------------------------------

-- Popular tabela facilitador

INSERT INTO facilitador (nome,cpf,area)
 
VALUES
  ('Hunter Blair','439.208.132-14',   'tech'),
  ('Cedric Payne','675.635.338-87',   'tech'),
  ('Sydnee Lester','328.121.498-02',  'tech'),
  ('Ethan Pearson','923.201.546-47',  'tech'),
  ('Quemby Mendez','854.330.578-60',  'tech'),
  ('Zachery Reeves','193.831.932-18', 'tech'),
  ('Adara Koch','528.635.334-85',     'soft'),
  ('Patience Bender','217.440.397-66','soft'),
  ('Callum Barber','351.461.900-31',  'soft'),
  ('Lyle Carroll','551.133.856-88',   'soft');

-- Popular tabela curso:

INSERT INTO curso (nome,  data_inicio, data_enceramento, status, carga_horaria, turno)
VALUES 
('WebDev Full Stack', '2019-02-06', '2019-08-06', 'Concluído'   , 672, 'Vespertino'), 
('Data Analytics'   , '2019-04-17', '2019-10-17', 'Concluído'   , 650, 'Vespertino'),
('WebDev Full Stack', '2019-06-22', '2019-12-20', 'Concluído'   , 696, 'Noturno'   ),
('Data Analytics'   , '2019-09-05', '2020-03-05', 'Concluído'   , 579, 'Noturno'   ),
('WebDev Full Stack', '2019-12-11', '2020-05-12', 'Concluído'   , 541, 'Noturno'   ),
('Data Analytics'   , '2020-03-15', '2020-09-18', 'Concluído'   , 563, 'Vespertino'),
('WebDev Full Stack', '2020-06-24', '2020-12-28', 'Concluído'   , 600, 'Noturno'   ),
('Data Analytics'   , '2020-08-20', '2021-02-25', 'Concluído'   , 609, 'Noturno'   ),
('WebDev Full Stack', '2020-10-03', '2021-04-07', 'Concluído'   , 591, 'Noturno'   ),
('Data Analytics'   , '2020-12-18', '2021-05-18', 'Concluído'   , 581, 'Vespertino'),
('WebDev Full Stack', '2021-02-08', '2021-08-08', 'Concluído'   , 656, 'Noturno'   ),
('Data Analytics'   , '2021-05-26', '2021-11-28', 'Concluído'   , 650, 'Noturno'   ),
('WebDev Full Stack', '2021-09-26', '2022-03-30', 'Concluído'   , 660, 'Vespertino'),
('Data Analytics'   , '2021-11-14', '2022-04-18', 'Concluído'   , 615, 'Vespertino'),
('WebDev Full Stack', '2021-12-20', '2022-05-20', 'Concluído'   , 632, 'Noturno'   ),
('Data Analytics'   , '2022-01-30', '2022-08-01', 'Concluído'   , 678, 'Noturno'   ),
('Data Analytics'   , '2022-03-02', '2022-09-05', 'Em Andamento', 657, 'Vespertino'),
('WebDev Full Stack', '2022-04-22', '2022-10-31', 'Em andamento', 604, 'Noturno'   ),
('Data Analytics'   , '2022-05-16', '2022-11-18', 'Em andamento', 682, 'Vespertino'),
('WebDev Full Stack', '2022-08-29', '2023-03-02', 'Em andamento', 650, 'Noturno'   ),
('Data Analytics'   , '2023-01-17', '2023-07-18', 'Programado'  , 650, 'Noturno'   );
 

-- Popular tabela aluno:

INSERT INTO Aluno (cpf,nome,email,cep,cidade,estado,celular,data_nacimento,escolaridade,genero,etnia,status_empregabilidade)
VALUES

('624.783.240-08','Carolina Márcia Sarah Jesus','carolina.jesus@outlook.com','29500970','Alegre','ES','(98)98319-4520','1990-07-12','Ensino Médio Completo','Feminino','negro','Buscando Emprego'),
('134.957.110-58','Sebastiana Isis Carvalho','sebastiana.carvalho@outlook.com','25251043','Duque de Caxias','RJ','(68)99648-6921','1990-09-25','Ensino Médio Completo','Não-binário','negro','Empregado - Tech'),
('319.725.970-00','Francisca Yasmin Rafaela Bernardes','francisca.bernardes@outlook.com','21843970','Rio de Janeiro','RJ','(61)97279-8964','2001-10-28','Ensino Médio Incompleto','Feminino','branco','Empregado - Tech'),
('376.133.930-54','Osvaldo Diogo Corte Real','osvaldo.real@outlook.com','68702180','Capanema','PA','(32)97936-3914','1991-07-02','Ensino Superior Completo','Masculino','indigena','Buscando Emprego'),
('548.636.900-02','Sarah Betina Eloá Galvão','sarah.galvao@outlook.com','89282545','São Bento do Sul','SC','(68)97524-4347','1996-04-17','Ensino Superior Completo','Feminino','negro','Buscando Emprego'),
('031.515.740-25','Bernardo Bento Nascimento','bernado.nascimento@outlook.com','29101360','Vila Velha','ES','(96)98769-7425','2000-11-18','Ensino Superiro Incompleto','Não-binário','branco','Buscando Emprego'),
('040.893.270-83','Manoel Benício Jorge Campos','manoel.campos@outlook.com','41307230','Salvador','BA','(84)98205-4547','1991-11-19','Ensino Médio Completo','Masculino','branco','Empregado - Tech'),
('734.806.390-03','Milena Aurora Tatiane Melo','milena.melo@outlook.com','69098600','Manaus','AM','(66)99177-2628','12-07-1990','Ensino Fundamental Completo','Masculino','branco','Buscando Emprego'),
('243.520.230-00','Leandro Jorge Thomas Rocha','leandro.rocha@outlook.com','29500970','Alegre','ES','(93)96739-0536','2000-02-23','Ensino Médio Completo','Feminino','negro','Buscando Emprego'),
('544.528.720-34','Noah Elias Costa','noah.costa@outlook.com','59124010','Natal','RN','(11)98117-1891','2002-11-15','Ensino Médio Completo','Masculino','negro','Buscando Emprego'),
('335.833.950-50','Lucas Fábio da Paz','lucas.paz@outlook.com','13275650','Valinhos','SP','(77)98587-7351','1996-03-01','Ensino Médio Completo','Não-binário','branco','Buscando Emprego'),
('009.344.610-15','Elaine Silvana Jaqueline Santos','elaine.santos@outlook.com','17065411','Bauru','SP','(92)98260-1704','2001-04-11','Ensino Médio Completo','Feminino','negro','Buscando Emprego'),
('098.660.450-05','Fernanda Sebastiana Nogueira','fernanda.nogueira@outlook.com','12223400','São José dos Campos','SP','(96)96707-4750','1994-11-26','Ensino Médio Completo','Feminino','negro','Buscando Emprego'),
('738.985.310-74','Isabelly Carla da Luz','isabelly.luz@outlook.com','29500970','Alegre','ES','(24)98623-6788','1996-01-05','Ensino Médio Completo','Feminino','indigena','Empregado - Tech'),
('642.993.950-26','Gabrielly Antônia Rafaela da Mata','gabrielly.mata@outlook.com','21843970','Rio de Janeiro','RJ','(91)97146-9961','12-07-1990','Ensino Médio Incompleto','Feminino','negro','Buscando Emprego'),
('508.776.320-06','Hadassa Analu Stella Pereira','hadassa.perreira@outlook.com','68702180','Capanema','PA','(82)98752-3446','1993-10-14','Ensino Superior Completo','Feminino','branco','Buscando Emprego'),
('564.098.550-01','Filipe Márcio Nathan Gonçalves','filipe.goncalves@outlook.com','89282545','São Bento do Sul','SC','(84)99984-2612','1991-12-25','Ensino Médio Completo','Masculino','branco','Buscando Emprego'),
('054.596.290-04','Sarah Alana Freitas','sarah.freitas@outlook.com','29101360','Vila Velha','ES','(67)99813-1215','1996-08-11','Ensino Médio Completo','Feminino','branco','Buscando Emprego'),
('336.199.830-11','Anthony Manuel Barbosa','anthony.barbosa@outlook.com','78035565','Cuiabá','MT','(79)98880-7032','1991-12-20','Ensino Médio Completo','Masculino','negro','Buscando Emprego'),
('624.783.240-08','João Kauê Porto','joao.porto@outlook.com','76829312','Porto Velho','RO','(62)98957-7116','1997-11-28','Ensino Médio Completo','Masculino','negro','Buscando Emprego'),
('410.468.538-48','Imani Hull','imanihull3339@aol.edu','67335-295','Parauapebas','PA','(67)14666-2379','1993-04-12','Ensino Médio Completo','feminino','branco','Buscando Emprego'),
('159.612.404-19','Aphrodite Noel','aphroditenoel@aol.com','66419-102','Cametá','PA','(41)26114-2467','1994-10-24','Ensino Superior Incompleto','masculino','indígena','Empregado - Tech'),
('733.648.858-90','Sydnee Bentley','sydneebentley@outlook.org','97441-468','Novo Hamburgo','RS','(21)38694-2374','1993-10-14','Ensino Superior Completo','masculino','negro','Empregado - Não Tech'),
('034.631.518-44','Alec Murray','alecmurray@protonmail.org','76741-401','Goiânia','GO','(39)29321-3513','2002-05-20','Ensino Médio Completo','feminino','branco ','Empregado - Tech'),
('558.608.525-53','Driscoll Erickson','driscollerickson4379@icloud.net','83768-056','Foz do Iguaçu','PR','(34)67936-2018','1994-11-26','Ensino Médio Completo','masculino','negro','Buscando Emprego'),
('037.101.211-65','Ferdinand Conrad','ferdinandconrad@icloud.net','21248-132','Petrópolis','RJ','(21)71229-7858','1994-08-07','Ensino Superior Incompleto','masculino','branco','Empregado - Tech'),
('277.955.328-17','Alika Pittman','alikapittman7519@google.edu','34674466','Juiz de Fora','MG','(72)27054-5407','1999-07-23','Ensino Superior Completo','feminino','indígena','Empregado - Não Tech'),
('311.888.637-17','Lewis Ashley','lewisashley@hotmail.ca','66336-618','Santarém','PA','(34)38504-2354','1999-12-10','Ensino Médio Completo','masculino','negro','Empregado - Tech'),
('733.065.348-68','Clayton Hebert','claytonhebert@icloud.org','65547-266','Timon','MA','(15)33413-2556','1991-07-23','Ensino Médio Completo','masculino','branco ','Buscando Emprego'),
('141.678.101-62','Grace Roach','graceroach7526@hotmail.edu','34366841','Governador Valadares','MG','(84)98275-7598','1991-11-15','Ensino Superior Incompleto','feminino','negro','Empregado - Tech'),
('871.521.154-30','Drake Jones','drakejones@hotmail.net','44742-560','Lauro de Freitas','BA','(58)61814-0384','1997-11-15','Ensino Superior Completo','masculino','branco','Empregado - Não Tech'),
('364.833.157-18','Camden Buck','camdenbuck2578@google.edu','19532-156','Campinas','SP','(82)78886-5576','1996-01-05','Ensino Médio Completo','masculino','indígena','Empregado - Tech'),
('462.889.414-78','Hilary Mullins','hilarymullins5608@google.net','75711-735','Aparecida de Goiânia','GO','(65)61606-2628','1997-10-24','Ensino Médio Completo','feminino','negro','Buscando Emprego'),
('875.524.616-36','Hakeem Jensen','hakeemjensen@aol.couk','86863-772','Maringá','PR','(28)37845-0258','1997-10-07','Ensino Superior Incompleto','masculino','branco ','Empregado - Tech'),
('518.227.840-67','Samuel Bentley','samuelbentley2747@protonmail.ca','27274-274','Petrópolis','RJ','(40)16739-2669','1991-12-25','Ensino Superior Completo','masculino','negro','Empregado - Não Tech'),
('558.141.752-39','Octavia Oneil','octaviaoneil2693@google.com','58584-175','Cajazeiras','PB','(22)14432-3008','1997-09-25','Ensino Médio Completo','feminino','branco','Empregado - Tech'),
('743.093.424-00','Fritz Cervantes','fritzcervantes9225@google.edu','87632-515','Guarapuava','PR','(42)24102-0189','1992-09-29','Ensino Médio Completo','masculino','indígena','Buscando Emprego'),
('189.973.118-62','Velma Roman','velmaroman@icloud.net','24636-651','São João de Meriti','RJ','(62)64848-2252','1994-10-30','Ensino Superior Incompleto','masculino','negro','Empregado - Tech'),
('051.513.544-78','Penelope Woods','penelopewoods@icloud.couk','60247-615','Itapipoca','CE','(81)87684-2424','1999-07-22','Ensino Superior Completo','feminino','branco ','Empregado - Não Tech'),
('226.551.268-21','Octavia Sosa','octaviasosa9636@icloud.edu','68646-582','Ananindeua','PA','(33)58435-7732','1997-08-28','Ensino Médio Completo','masculino','negro','Empregado - Tech'),
('387.467.873-59','Ora Dale','oradale@aol.com','42846-529','Camaçari','BA','(52)10103-6782','2002-11-16','Ensino Médio Completo','masculino','branco','Buscando Emprego'),
('726.112.033-71','Ira Buckley','irabuckley1866@google.couk','65628-820','Codó','MA','(95)89267-8393','2003-01-01','Ensino Superior Incompleto','feminino','indígena','Empregado - Tech'),
('752.256.894-54','Carol Alvarado','carolalvarado1179@hotmail.ca','74741-415','Aparecida de Goiânia','GO','(72)56663-8282','1999-10-21','Ensino Superior Completo','masculino','negro','Empregado - Não Tech'),
('165.153.811-08','Ariel Cochran','arielcochran@google.couk','32240042','Santa Luzia','MG','(15)71888-5447','1998-10-04','Ensino Médio Completo','masculino','branco ','Empregado - Tech'),
('303.551.362-77','Raphael Armstrong','raphaelarmstrong1972@protonmail.edu','32856505','Uberlândia','MG','(34)28219-3733','1996-12-28','Ensino Médio Completo','feminino','negro','Buscando Emprego'),
('967.814.085-42','Willa Rodgers','willarodgers@yahoo.net','75743-767','Valparaíso de GO','GO','(18)62153-1702','1990-07-05','Ensino Superior Incompleto','masculino','branco','Empregado - Tech'),
('883.232.419-43','Christopher Larson','christopherlarson@outlook.net','26946-133','Duque de Caxias','RJ','(61)61187-2353','1998-02-02','Ensino Superior Completo','masculino','indígena','Empregado - Não Tech'),
('835.312.257-92','Alden Mayer','aldenmayer@protonmail.ca','88460-882','São José','SC','(77)52605-5913','2001-03-21','Ensino Médio Completo','feminino','negro','Empregado - Tech'),
('503.340.749-39','Christen Marks','christenmarks6880@icloud.ca','27218-422','Belford Roxo','RJ','(06)15466-4075','1996-03-01','Ensino Médio Completo','masculino','branco ','Buscando Emprego'),
('681.582.353-39','Kevin Finley','kevinfinley@yahoo.com','19769-879','Mauá','SP','(71)06135-1959','1990-08-26','Ensino Superior Incompleto','masculino','negro','Empregado - Tech'),
('896.736.335-22','Iris Mcconnell','irismcconnell9470@outlook.org','27216-727','São João de Meriti','RJ','(43)34268-3830','2001-04-11','Ensino Superior Completo','feminino','branco','Empregado - Não Tech'),
('769.719.589-87','Mari Farmer','marifarmer282@google.com','58428-126','Bayeux','PB','(54)06344-8514','2001-11-02','Ensino Médio Completo','masculino','indígena','Empregado - Tech'),
('611.462.289-48','Ashton Stokes','ashtonstokes3956@hotmail.couk','42895-293','Juazeiro','BA','(37)57241-3848','1993-01-26','Ensino Médio Completo','masculino','negro','Buscando Emprego'),
('948.068.738-82','Amaya Golden','amayagolden@protonmail.net','55445-165','Olinda','PE','(64)78287-7760','2002-11-15','Ensino Superior Incompleto','feminino','branco ','Empregado - Tech'),
('281.492.818-28','Axel Mitchell','axelmitchell3616@yahoo.ca','76780-134','Anápolis','GO','(21)03738-3266','2001-09-21','Ensino Superior Completo','masculino','negro','Empregado - Não Tech'),
('324.592.637-35','Hayes Mann','hayesmann8383@icloud.edu','24180-898','São Gonçalo','RJ','(11)68400-1196','2001-08-20','Ensino Médio Completo','masculino','branco','Empregado - Tech'),
('327.484.787-41','Kelsie Hodge','kelsiehodge903@hotmail.org','61511-568','Itapipoca','CE','(56)27598-5184','1999-04-24','Ensino Médio Completo','feminino','indígena','Buscando Emprego'),
('918.232.660-85','Ulric Clarke','ulricclarke@icloud.ca','26558-115','Duque de Caxias','RJ','(13)12363-7726','1997-07-31','Ensino Superior Incompleto','masculino','negro','Empregado - Tech'),
('415.622.531-57','Carlos Schroeder','carlosschroeder@hotmail.ca','60169-758','Sobral','CE','(24)94363-4462','2000-01-10','Ensino Superior Completo','masculino','branco ','Empregado - Não Tech'),
('520.588.627-64','Cruz Crawford','cruzcrawford@icloud.edu','87291-387','Paranaguá','PR','(23)36062-6551','1993-07-15','Ensino Médio Completo','feminino','negro','Empregado - Tech'),
('775.323.799-70','Venus Dunlap','venusdunlap50@hotmail.ca','81397-645','Maringá','PR','(82)37488-4530','1995-11-26','Ensino Médio Completo','masculino','branco','Buscando Emprego'),
('179.454.747-53','Malik Dale','malikdale@google.edu','58786-314','Campina Grande','PB','(64)65851-8724','1996-03-31','Ensino Superior Incompleto','masculino','indígena','Empregado - Tech'),
('725.486.194-78','Ulla Mcknight','ullamcknight2267@hotmail.com','25525-333','Rio de Janeiro','RJ','(50)52760-9071','1993-09-22','Ensino Superior Completo','feminino','negro','Empregado - Não Tech'),
('795.946.377-49','Axel Rivas','axelrivas2613@icloud.ca','93313-743','Caxias do Sul','RS','(46)62863-3747','2001-10-05','Ensino Médio Completo','masculino','branco ','Empregado - Tech'),
('713.112.761-48','Fletcher Strickland','fletcherstrickland6015@hotmail.ca','55785-868','Camaragibe','PE','(04)16494-7228','1997-01-23','Ensino Médio Completo','masculino','negro','Buscando Emprego'),
('023.163.944-59','Colby Villarreal','colbyvillarreal8124@hotmail.ca','11113-967','Carapicuíba','SP','(86)27880-4513','1991-04-09','Ensino Superior Incompleto','feminino','branco','Empregado - Tech'),
('486.258.057-54','Dylan Garza','dylangarza3968@google.couk','87597-758','Cascavel','PR','(62)15448-3227','1996-02-03','Ensino Superior Completo','masculino','indígena','Empregado - Não Tech'),
('526.046.712-38','Reece Long','reecelong@hotmail.edu','54358-418','Cabo de Santo Agostinho','PE','(13)07538-6761','1989-10-19','Ensino Médio Completo','masculino','negro','Empregado - Tech'),
('755.151.213-54','Jarrod Phillips','jarrodphillips6318@aol.net','32167142','Uberaba','MG','(15)52771-5173','1991-07-23','Ensino Médio Completo','feminino','branco ','Buscando Emprego'),
('164.742.553-56','Hu Duran','huduran@aol.ca','50231-706','Olinda','PE','(48)46366-2776','1990-06-12','Ensino Superior Incompleto','masculino','negro','Empregado - Tech'),
('261.974.481-82','Marah Beach','marahbeach@aol.ca','67152-275','Ananindeua','PA','(88)28496-1489','1996-03-21','Ensino Superior Completo','masculino','branco','Empregado - Não Tech'),
('464.594.617-43','Vivian Terrell','vivianterrell2892@google.ca','67479-751','Bragança','PA','(11)77161-3054','1996-08-11','Ensino Médio Completo','feminino','indígena','Empregado - Tech'),
('712.237.605-91','Karleigh Parsons','karleighparsons@aol.couk','85345-153','São José dos Pinhais','PR','(78)25255-4417','1991-12-20','Ensino Médio Completo','masculino','negro','Buscando Emprego'),
('137.845.174-62','Elliott Brock','elliottbrock@yahoo.net','66570-570','Castanhal','PA','(11)46808-1220','1989-09-20','Ensino Superior Incompleto','masculino','branco ','Empregado - Tech'),
('428.486.815-27','Camilla Navarro','camillanavarro@google.edu','67023-443','Abaetetuba','PA','(78)74667-4426','1990-09-25','Ensino Superior Completo','feminino','negro','Empregado - Não Tech'),
('713.504.112-82','Calvin Gay','calvingay303@yahoo.edu','58104-785','Santa Rita','PB','(77)99498-2657','1992-12-29','Ensino Médio Completo','masculino','branco','Empregado - Tech'),
('581.474.992-01','Leonard Lindsay','leonardlindsay3256@outlook.com','61835-844','Fortaleza','CE','(32)53585-1715','1992-06-30','Ensino Médio Completo','masculino','indígena','Buscando Emprego'),
('631.264.384-95','Mara Raymond','mararaymond7558@google.ca','43085-496','Vitória da Conquista','BA','(25)05640-6457','1994-06-25','Ensino Superior Incompleto','feminino','negro','Empregado - Tech'),
('345.912.047-76','Leah Acevedo','leahacevedo3543@google.org','67525-560','Castanhal','PA','(64)61432-5781','1995-05-08','Ensino Superior Completo','masculino','branco ','Empregado - Não Tech'),
('343.632.234-13','Neil Kidd','neilkidd@aol.org','91525-111','Novo Hamburgo','RS','(46)85496-6708','1998-02-28','Ensino Médio Completo','masculino','negro','Empregado - Tech'),
('345.865.488-54','Alden Lester','aldenlester3634@icloud.ca','58435-666','João Pessoa','PB','(71)12635-3579','2001-10-28','Ensino Médio Completo','feminino','branco','Buscando Emprego'),
('651.372.929-82','Lara Hawkins','larahawkins@icloud.ca','52189-771','Cabo de Santo Agostinho','PE','(57)21863-1355','1991-08-22','Ensino Superior Incompleto','masculino','indígena','Empregado - Tech'),
('991.961.862-97','Iola Evans','iolaevans234@outlook.ca','65359-135','Imperatriz','MA','(22)98592-2671','1992-11-14','Ensino Superior Completo','masculino','negro','Empregado - Não Tech'),
('862.794.641-62','Willow Forbes','willowforbes@aol.com','88763-935','Itajaí','SC','(67)46723-4938','1992-10-11','Ensino Médio Completo','feminino','branco ','Empregado - Tech'),
('757.246.161-69','Keaton Rogers','keatonrogers@icloud.couk','84196-356','Guarapuava','PR','(62)44917-3174','1997-11-28','Ensino Médio Completo','masculino','negro','Buscando Emprego'),
('433.298.787-41','Demetria Little','demetrialittle3521@aol.couk','52297-985','Camaragibe','PE','(25)09231-8372','1996-04-17','Ensino Superior Incompleto','masculino','branco','Empregado - Tech'),
('268.755.777-02','Igor Byrd','igorbyrd6140@outlook.org','32108984','Uberlândia','MG','(82)12317-8875','1993-06-06','Ensino Superior Completo','feminino','indígena','Empregado - Não Tech'),
('967.068.496-22','Steel Riley','steelriley@outlook.net','80054-431','Ponta Grossa','PR','(99)85984-6989','2001-02-04','Ensino Médio Completo','masculino','negro','Empregado - Tech'),
('747.154.610-33','Abbot Parsons','abbotparsons@hotmail.edu','65061-643','Balsas','MA','(62)05574-8231','2000-11-18','Ensino Médio Completo','masculino','branco ','Buscando Emprego'),
('715.206.769-71','Karleigh Stout','karleighstout@protonmail.net','52660-566','Olinda','PE','(61)92337-7015','2000-11-21','Ensino Superior Incompleto','feminino','negro','Empregado - Tech'),
('258.104.220-96','Brenna Shaffer','brennashaffer8126@aol.edu','33534438','Juiz de Fora','MG','(87)32964-3737','1992-10-04','Ensino Superior Completo','masculino','branco','Empregado - Não Tech'),
('258.406.335-36','Oren Buchanan','orenbuchanan470@protonmail.org','53138-794','Jaboatão dos Guararapes','PE','(68)66283-2201','1991-11-19','Ensino Médio Completo','masculino','indígena','Empregado - Tech'),
('513.636.857-23','Palmer Gonzales','palmergonzales@aol.com','43586-144','Lauro de Freitas','BA','(17)25587-4438','2000-02-23','Ensino Médio Completo','feminino','negro','Buscando Emprego'),
('275.874.848-58','Wendy Price','wendyprice@yahoo.edu','65580-135','Paço do Lumiar','MA','(39)16295-6112','1997-11-12','Ensino Superior Incompleto','masculino','branco ','Empregado - Tech'),
('183.899.747-82','Lillian Baker','lillianbaker609@yahoo.org','17803-146','Jundiaí','SP','(65)27237-3416','1999-11-28','Ensino Superior Completo','masculino','negro','Empregado - Não Tech'),
('657.143.707-14','Oren Snider','orensnider221@outlook.net','17443-870','Jundiaí','SP','(96)78152-8668','1990-01-12','Ensino Médio Completo','feminino','branco','Empregado - Tech'),
('303.543.667-29','Fleur Morse','fleurmorse@aol.edu','75737-271','Luziânia','GO','(30)14428-8664','1991-12-12','Ensino Médio Completo','masculino','indígena','Buscando Emprego'),
('618.332.204-47','Hayfa Donaldson','hayfadonaldson@protonmail.net','97529-834','Porto Alegre','RS','(52)58378-9693','2000-05-03','Ensino Superior Incompleto','masculino','negro','Empregado - Tech'),
('161.396.587-59','Charde Kinney','chardekinney@google.edu','39518841','Ipatinga','MG','(75)74366-4434','1989-12-12','Ensino Superior Completo','feminino','branco ','Empregado - Não Tech'),
('714.866.985-26','Clio Donovan','cliodonovan@yahoo.net','83942-822','Cascavel','PR','(48)63534-6316','1996-08-03','Ensino Médio Completo','masculino','negro','Empregado - Tech');

-- Popular tabela modulo:
INSERT into modulo (id_curso, nivel, ementa, facilitador_soft, facilitador_tech, carga_horaria, status_modulo)
VALUES
(1, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7, 1, 60, 'Concluído'),       
(1, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7, 1, 60, 'Concluído'),       
(1, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.',7,1, 60, 'Concluído'),       
(1, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.',  7, 1, 60, 'Concluído'),    
(1, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.',  7, 1, 60, 'Concluído'),
(3, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.',  7, 2, 60, 'Concluído'),       
(3, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github. Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7, 2, 60, 'Concluído'),       
(3, '3º', 'Hard:Modelagem de banco de dados com foco em BI. Soft: Metodologias Ágeis: SCRUM.', 7, 2, 60, 'Concluído'),       
(3, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7, 2, 60, 'Concluído'),    
(3, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 7, 2, 60, 'Concluído'),     
(5, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7, 3, 60, 'Concluído'),       
(5, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.',  7, 3, 60,  'Concluído'),       
(5, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,3 , 60 ,'Concluído'),       
(5, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.',  7, 3, 60,'Concluído'),    
(5, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.',  7, 3, 60, 'Concluído'),    
(7, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 9,2 ,60, 'Concluído'),       
(7, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 9,2,60, 'Concluído'),       
(7, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 9,3 ,60, 'Concluído'),       
(7, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 9,2, 60, 'Concluído'),    
(7, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 9,2,60,  'Concluído'),
(9, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7,3 ,60, 'Concluído'),       
(9, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7,3, 60,'Concluído'),       
(9, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,3,60, 'Concluído'),       
(9, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7,3, 60,'Concluído'),    
(9, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.',7,3, 60,'Concluído'), 
(11, '1º','Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7,2 ,60, 'Concluído'),       
(11, '2º','Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7, 2,60, 'Concluído'),       
(11, '3º','Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,2 , 60,'Concluído'),       
(11, '4º','Hard: Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7,2 ,60, 'Concluído'),    
(11, '5º','Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 7,2, 60,'Concluído'),   
(13, '1º','Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 7,3,60,  'Concluído'),       
(13, '2º','Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 7,3 , 60,'Concluído'),       
(13, '3º','Hard: Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 7,3,60, 'Concluído'),       
(13, '4º','Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 7,3, 60,'Concluído'),    
(13, '5º','Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 9,5, 60, 'Concluído'), 
(15, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 9,5, 60, 'Concluído'),       
(15, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 9,5, 60,'Concluído'),       
(15, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 9,5, 60,'Concluído'),       
(15, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', 9,5,60, 'Concluído'),    
(15, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 9,5,60, 'Concluído'),  
(18, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 10,5, 72,'Concluído'),       
(18, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 10,5, 72,'Concluído'),       
(18, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 10,5, 72, 'Concluído'),       
(18, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.',10,5, 72,'Em andamento'),    
(18, '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 10,5, 72,'Não iniciado'),    
(20, '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', 8,3, 72, 'Em andamento'),       
(20, '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', 8,3, 72, 'Não iniciado'),       
(20, '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', 8,3, 72, 'Não iniciado'),      
(20, '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.' , 8,3, 72,'Não iniciado'),    
(20, '5º', 'Hard:Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', 8,3,72, 'Não iniciado'),   
(2, '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 8,2,72, 'Concluído'),
(2, '2º',  'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 8,2,72, 'Concluído'),
(2, '3º',  'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 8,2, 72,'Concluído'),
(2, '4º',  'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 8,2, 72, 'Concluído'),
(2, '5º',  'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 8,2,72, 'Concluído'),
(4, '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 7,4,72, 'Concluído'),
(4, '2º',  'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 7,4, 72,'Concluído'),
(4, '3º',  'Hard: Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 7,4, 72, 'Concluído'),
(4, '4º',  'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 7,4,72, 'Concluído'),
(4, '5º',  'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 7,4,72, 'Concluído'),
(6, '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 7,5, 72,'Concluído'),
(6, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 7,5, 72,'Concluído'),
(6, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 7,5,72, 'Concluído'),
(6, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.',7,5, 72, 'Concluído'),
(6, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 7,5,72, 'Concluído'),
(8, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.',9,6,72, 'Concluído'),
(8, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.',9,6,72, 'Concluído'),
(8, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 9,6, 72,'Concluído'),
(8, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 9,6, 72, 'Concluído'),
(8, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 9,6, 72,'Concluído'),
(10, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 8,1, 72,'Concluído'),
(10, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 8,1,72, 'Concluído'),
(10, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.',8,1,72, 'Concluído'),
(10, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.',8,1,72, 'Concluído'),
(10, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 8,1,72, 'Concluído'),
(12, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 9,4, 72,'Concluído'),
(12, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 9,4, 72, 'Concluído'),
(12, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 9,4,72, 'Concluído'),
(12, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 9,4, 72, 'Concluído'),
(12, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,1, 72, 'Concluído'),
(14, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 10,1, 72 ,'Concluído'),
(14, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 10,1, 72,'Concluído'),
(14, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 10,1,72, 'Concluído'),
(14, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 10,1, 72, 'Concluído'),
(14, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,1, 72,'Concluído'),
(16, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 10,5,72, 'Concluído'),
(16, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 10,5,72, 'Concluído'),
(16, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 10,5,72, 'Concluído'),
(16, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.',10,5,72, 'Concluído'),
(16, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,5, 72,'Concluído'),
(17, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 10,4,72, 'Concluído'),
(17, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 10,4, 72, 'Concluído'),
(17, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 10,4,72, 'Concluído'),
(17, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 10,4,72, 'Concluído'),
(17, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 10,4, 72,'Em andamento'),
(19, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 7,4,72, 'Concluído'),
(19, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 7,4,72, 'Concluído'),
(19, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 7,4,72, 'Em andamento'),
(19, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 7,4,72, 'Não iniciado'),
(19, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 7,4,72, 'Não iniciado'),
(21, '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', 9,3,72, 'Não iniciado'),
(21, '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', 9,3,72,'Não iniciado'),
(21, '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', 9,3,72,'Não iniciado'),
(21, '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', 9,3,72,'Não iniciado'),
(21, '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', 9,3,72,'Não iniciado');


-- Popular tabela matricula:
 
INSERT INTO matricula (id_aluno, id_curso, status)
VALUES 
(1,1,'Concluído'),
(2,2,'Concluído'),
(3,3,'Concluído'),
(4,4,'Concluído'),
(5,5,'Concluído'),
(6,6,'Concluído'),
(7,7,'Concluído'),
(8,8,'Concluído'),
(9,9,'Concluído'),
(10,10,'Concluído'),
(11,11,'Concluído'),
(12,12,'Concluído'),
(13,13,'Concluído'),
(14,14,'Concluído'),
(15,15,'Concluído'),
(16,16,'Concluído'),
(17,17,'Em Andamento'),
(18,18,'Em andamento'),
(19,19,'Em andamento'),
(20,20,'Em andamento'),
(21,7,'Concluído'),
(22,6,'Concluído'),
(23,12,'Concluído'),
(24,7,'Concluído'),
(25,19,'Em andamento'),
(26,6,'Concluído'),
(27,2,'Concluído'),
(28,18,'Em andamento'),
(29,10,'Concluído'),
(30,12,'Concluído'),
(31,12,'Concluído'),
(32,10,'Concluído'),
(33,4,'Concluído'),
(34,18,'Em andamento'),
(35,4,'Concluído'),
(36,2,'Concluído'),
(37,4,'Concluído'),
(38,8,'Concluído'),
(39,5,'Concluído'),
(40,12,'Concluído'),
(41,10,'Concluído'),
(42,9,'Concluído'),
(43,16,'Concluído'),
(44,19,'Em andamento'),
(45,9,'Concluído'), 
(46,4,'Concluído'),
(47,11,'Concluído'),
(48,19,'Em andamento'),
(49,3,'Concluído'),
(50,18,'Em andamento'),
(51,6,'Concluído'),
(52,14,'Concluído'),
(53,14,'Concluído'),
(54,8,'Concluído'),
(55,16,'Concluído'),
(56,12,'Concluído'),
(57,18,'Em andamento'),
(58,4,'Concluído'),
(59,15,'Concluído'),
(60,6,'Concluído'),
(61,16,'Concluído'),
(62,6,'Concluído'),
(63,13,'Concluído'),
(64,8,'Concluído'),
(65,18,'Em andamento'),
(66,10,'Concluído'),
(67,10,'Concluído'),
(68,16,'Concluído'),
(69,1,'Concluído'),
(70,18,'Em andamento'),
(71,16,'Concluído'),
(72,15,'Concluído'),
(73,15,'Concluído'),
(74,10,'Concluído'),
(75,2,'Concluído'),
(76,5,'Concluído'),
(77,12,'Concluído'),
(78,13,'Concluído'),
(79,8,'Concluído'),
(80,13,'Concluído'),
(81,7,'Concluído'),
(82,17,'Em Andamento'),
(83,7,'Concluído'),
(84,8,'Concluído'),
(85,18,'Em andamento'),
(86,9,'Concluído'),
(87,11,'Concluído'),
(88,3,'Concluído'),
(89,6,'Concluído'),
(90,7,'Concluído'),
(91,10,'Concluído'),
(92,4,'Concluído'),
(93,14,'Concluído'),
(94,10,'Concluído'),
(95,19,'Em andamento'),
(96,10,'Concluído'),
(97,2,'Concluído'),
(98,6,'Concluído'),
(99,6,'Concluído'),
(100,12,'Concluído');

-- Popular tabela projetos:

INSERT INTO projeto_final (id_matricula, id_modulo, nota_tech,nota_soft)
values

(1,1,3,2),
(1,2,2,2),
(1,3,3,2),
(1,4,4,2),
(1,5,2,2),
(2,51,2,2),
(2,52,3,2),
(2,53,5,2),
(2,54,4,2),
(2,55,4,2),
(3,6,3,2),
(3,7,2,2),
(3,8,4,2),
(3,9,4,2),
(3,10,3,2),
(4,56,2,2),
(4,57,4,2),
(4,58,3,2),
(4,59,3,2),
(4,60,4,2),
(5,11,3,2),
(5,12,1,2),
(5,13,4,2),
(5,14,3,2),
(5,15,3,2),
(6,61,2,2),
(6,62,5,2),
(6,63,2,2),
(6,64,5,2),
(6,65,1,2),
(7,16,2,2),
(7,17,2,2),
(7,18,2,2),
(7,19,4,2),
(7,20,2,2),
(8,66,1,2),
(8,67,2,2),
(8,68,5,2),
(8,69,4,2),
(8,70,3,2),
(9,21,4,2),
(9,22,2,2),
(9,23,3,2),
(9,24,3,2),
(9,25,2,2),
(10,71,4,3),
(10,72,1,2),
(10,73,3,2),
(10,74,1,3),
(10,75,4,4),
(11,26,5,3),
(11,27,4,1),
(11,28,5,4),
(11,29,4,3),
(11,30,3,4),
(12,76,2,1),
(12,77,4,2),
(12,78,4,2),
(12,79,2,2),
(12,80,3,2),
(13,31,1,4),
(13,32,2,2),
(13,33,3,3),
(13,34,3,1),
(13,35,5,2),
(14,81,2,4),
(14,82,3,2),
(14,83,4,3),
(14,84,4,2),
(14,85,4,4),
(15,36,2,4),
(15,37,1,3),
(15,38,1,3),
(15,39,3,2),
(15,40,2,4),
(16,86,3,1),
(16,87,3,3),
(16,88,1,4),
(16,89,4,3),
(16,90,1,2),
(17,91,4,4),
(17,92,2,3),
(17,93,2,1),
(17,94,1,3),
(17,95,2,2),
(18,41,1,3),
(18,42,2,4),
(18,43,4,3),
(18,44,1,2),
(18,45,3,2),
(19,96,4,3),
(19,97,2,2),
(19,98,4,2),
(19,99,2,2),
(19,100,3,2),
(20,46,5,3),
(20,47,2,3),
(20,48,5,2),
(20,49,2,4),
(20,50,5,2),
(21,16,5,2),
(21,17,3,1),
(21,18,3,3),
(21,19,4,2),
(21,20,1,2),
(22,61,2,2),
(22,62,4,3),
(22,63,1,3),
(22,64,3,1),
(22,65,5,3),
(23,76,3,1),
(23,77,3,3),
(23,78,5,2),
(23,79,4,4),
(23,80,1,3),
(24,16,3,3),
(24,17,2,3),
(24,18,1,3),
(24,19,2,1),
(24,20,1,3),
(25,96,3,1),
(25,97,4,2),
(25,98,2,1),
(25,99,3,2),
(25,100,5,3),
(26,61,4,4),
(26,62,3,1),
(26,63,4,3),
(26,64,4,2),
(26,65,4,4),
(27,51,2,2),
(27,52,5,3),
(27,53,1,3),
(27,54,4,3),
(27,55,2,3),
(28,41,3,2),
(28,42,1,2),
(28,43,1,3),
(28,44,2,2),
(28,45,1,1),
(29,71,2,2),
(29,72,2,3),
(29,73,1,2),
(29,74,4,3),
(29,75,4,3),
(30,76,4,4),
(30,77,2,3),
(30,78,3,2),
(30,79,1,1),
(30,80,2,1),
(31,76,2,1),
(31,77,2,4),
(31,78,4,3),
(31,79,3,3),
(31,80,3,2),
(32,71,3,3),
(32,72,3,3),
(32,73,2,3),
(32,74,4,3),
(32,75,3,4),
(33,56,3,2),
(33,57,5,3),
(33,58,2,3),
(33,59,1,2),
(33,60,2,2),
(34,41,4,4),
(34,42,4,1),
(34,43,4,3),
(34,44,2,3),
(34,45,2,2),
(35,56,5,3),
(35,57,1,2),
(35,58,2,4),
(35,59,3,2),
(35,60,4,4),
(36,51,3,2),
(36,52,4,3),
(36,53,4,2),
(36,54,4,3),
(36,55,2,3),
(37,56,2,3),
(37,57,3,1),
(37,58,5,3),
(37,59,2,3),
(37,60,2,3),
(38,66,1,4),
(38,67,4,2),
(38,68,5,3),
(38,69,2,4),
(38,70,3,2),
(39,11,1,3),
(39,12,2,4),
(39,13,3,3),
(39,14,4,5),
(39,15,5,4),
(40,76,4,2),
(40,77,3,2),
(40,78,4,1),
(40,79,3,3),
(40,80,2,2),
(41,71,1,3),
(41,72,3,1),
(41,73,2,2),
(41,74,2,1),
(41,75,4,3),
(42,21,4,3),
(42,22,2,2),
(42,23,2,2),
(42,24,2,2),
(42,25,1,4),
(43,86,1,3),
(43,87,3,1),
(43,88,5,2),
(43,89,3,3),
(43,90,4,1),
(44,96,4,3),
(44,97,4,2),
(44,98,2,1),
(44,99,5,4),
(44,100,4,2),
(45,21,2,3),
(45,22,4,3),
(45,23,4,1),
(45,24,1,3),
(45,25,2,2),
(46,56,3,2),
(46,57,1,1),
(46,58,3,3),
(46,59,4,2),
(46,60,3,3),
(47,26,2,2),
(47,27,3,2),
(47,28,4,2),
(47,29,3,1),
(47,30,3,2),
(48,96,4,4),
(48,97,4,2),
(48,98,5,2),
(48,99,1,3),
(48,100,2,1),
(49,6,3,1),
(49,7,4,2),
(49,8,4,4),
(49,9,2,4),
(49,10,4,3),
(50,41,5,3),
(50,42,4,1),
(50,43,5,4),
(50,44,3,4),
(50,45,3,3),
(51,61,2,3),
(51,62,2,3),
(51,63,1,1),
(51,64,4,2),
(51,65,4,3),
(52,81,2,4),
(52,82,2,2),
(52,83,4,1),
(52,84,1,2),
(52,85,4,2),
(53,81,2,3),
(53,82,4,3),
(53,83,4,2),
(53,84,3,1),
(53,85,2,3),
(54,66,2,3),
(54,67,4,3),
(54,68,5,2),
(54,69,4,3),
(54,70,3,3),
(55,86,3,3),
(55,87,3,3),
(55,88,2,1),
(55,89,2,2),
(55,90,4,2),
(56,76,2,2),
(56,77,3,3),
(56,78,2,3),
(56,79,3,1),
(56,80,4,2),
(57,41,3,4),
(57,42,3,4),
(57,43,3,2),
(57,44,4,2),
(57,45,4,3),
(58,56,5,4),
(58,57,2,3),
(58,58,2,3),
(58,59,1,3),
(58,60,3,2),
(59,36,2,2),
(59,37,2,3),
(59,38,4,3),
(59,39,4,1),
(59,40,4,2),
(60,61,3,3),
(60,62,5,3),
(60,63,4,1),
(60,64,3,4),
(60,65,4,1),
(61,86,3,2),
(61,87,1,1),
(61,88,4,3),
(61,89,5,2),
(61,90,3,2),
(62,61,3,3),
(62,62,1,4),
(62,63,2,2),
(62,64,4,3),
(62,65,5,4),
(63,31,3,1),
(63,32,2,3),
(63,33,3,2),
(63,34,4,3),
(63,35,3,3),
(64,66,3,1),
(64,67,2,3),
(64,68,3,3),
(64,69,2,2),
(64,70,3,4),
(65,41,3,1),
(65,42,2,2),
(65,43,1,3),
(65,44,4,2),
(65,45,5,3),
(66,71,4,3),
(66,72,4,4),
(66,73,3,2),
(66,74,4,3),
(66,75,2,2),
(67,71,2,3),
(67,72,3,3),
(67,73,1,2),
(67,74,1,3),
(67,75,5,3),
(68,86,5,4),
(68,87,3,3),
(68,88,5,3),
(68,89,2,3),
(68,90,1,2),
(69,1,3,1),
(69,2,2,2),
(69,3,2,3),
(69,4,3,2),
(69,5,5,1),
(70,41,2,4),
(70,42,4,3),
(70,43,2,1),
(70,44,3,1),
(70,45,3,3),
(71,86,2,3),
(71,87,4,3),
(71,88,5,3),
(71,89,4,1),
(71,90,3,3),
(72,36,5,2),
(72,37,1,3),
(72,38,4,4),
(72,39,1,2),
(72,40,1,4),
(73,36,2,3),
(73,37,2,1),
(73,38,4,4),
(73,39,2,3),
(73,40,4,2),
(74,71,4,3),
(74,72,5,3),
(74,73,1,1),
(74,74,2,2),
(74,75,1,4),
(75,51,4,4),
(75,52,4,2),
(75,53,1,4),
(75,54,5,4),
(75,55,3,3),
(76,11,3,1),
(76,12,2,2),
(76,13,3,3),
(76,14,1,3),
(76,15,3,1),
(77,76,1,4),
(77,77,1,3),
(77,78,5,2),
(77,79,4,3),
(77,80,2,3),
(78,31,5,3),
(78,32,4,3),
(78,33,1,1),
(78,34,2,2),
(78,35,3,2),
(79,66,2,2),
(79,67,5,3),
(79,68,2,4),
(79,69,3,3),
(79,70,5,3),
(80,31,2,3),
(80,32,3,3),
(80,33,3,1),
(80,34,2,4),
(80,35,3,1),
(81,16,1,2),
(81,17,3,3),
(81,18,3,1),
(81,19,4,3),
(81,20,1,2),
(82,91,2,4),
(82,92,4,2),
(82,93,4,3),
(82,94,4,1),
(82,95,5,2),
(83,16,4,2),
(83,17,2,1),
(83,18,1,2),
(83,19,5,2),
(83,20,4,3),
(84,66,4,3),
(84,67,2,2),
(84,68,3,3),
(84,69,2,1),
(84,70,2,2),
(85,41,2,3),
(85,42,3,4),
(85,43,3,1),
(85,44,3,4),
(85,45,4,2),
(86,21,4,2),
(86,22,5,1),
(86,23,2,4),
(86,24,5,3),
(86,25,2,2),
(87,26,2,2),
(87,27,4,3),
(87,28,1,3),
(87,29,2,2),
(87,30,2,1),
(88,6,3,1),
(88,7,2,3),
(88,8,1,2),
(88,9,4,3),
(88,10,3,1),
(89,61,4,3),
(89,62,3,3),
(89,63,1,3),
(89,64,4,4),
(89,65,4,2),
(90,16,4,2),
(90,17,2,3),
(90,18,4,4),
(90,19,3,3),
(90,20,4,3),
(91,71,1,2),
(91,72,5,2),
(91,73,4,2),
(91,74,1,2),
(91,75,4,3),
(92,56,4,3),
(92,57,3,2),
(92,58,4,4),
(92,59,1,1),
(92,60,4,3),
(93,81,3,4),
(93,82,3,2),
(93,83,1,2),
(93,84,4,3),
(93,85,4,2),
(94,71,1,3),
(94,72,4,3),
(94,73,3,3),
(94,74,4,2),
(94,75,2,4),
(95,96,5,3),
(95,97,4,3),
(95,98,1,1),
(95,99,1,3),
(95,100,1,2),
(96,71,1,3),
(96,72,3,3),
(96,73,2,2),
(96,74,2,4),
(96,75,5,2),
(97,51,4,4),
(97,52,3,3),
(97,53,2,2),
(97,54,2,3),
(97,55,4,1),
(98,61,1,2),
(98,62,2,1),
(98,63,4,2),
(98,64,3,1),
(98,65,2,1),
(99,61,3,3),
(99,62,4,1),
(99,63,1,3),
(99,64,4,1),
(99,65,3,2),
(100,76,2,2),
(100,77,3,3),
(100,78,1,3),
(100,79,4,4),
(100,80,5,2);

---------------------------------------------------------------- QUERIES: -------------------------------------------------------------------------------------------
 
--  QUERY 1: Selecionar a quantidade total de estudantes cadastrados no banco;

 select count(id_aluno) as "Número de alunos" from aluno;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
-- QUERY 2: Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;

 select aluno.nome as "Aluno", curso.nome as "Curso"
 from aluno
 inner join matricula on matricula.id_aluno = aluno.id_aluno
 inner join curso on curso.id_curso = matricula.id_curso;

  -- 2.a) Quantos alunos cadastrados por curso? 
  
  select c.nome, c.id_curso , count(m.id_aluno) as "Numero de alunos por curso"  from curso c 
  inner join matricula as m  on m.id_curso  = c.id_curso 
  inner join aluno as a  on a.id_aluno = m.id_aluno
  group by c.id_curso 
  order by c.id_curso;

  -- 2.b) Qual curso tem mais alunos cadastrados?
  
  select c.id_curso, c.nome, count(a.id_aluno) 
  from curso as c 
  inner join matricula as m on m.id_curso = c.id_curso 
  inner join aluno as a on a.id_aluno = m.id_aluno 
  group by c.id_curso
  having count(a.id_aluno) = (
    select max(numero.n_alunos) from(
      select count(a.id_aluno) as "n_alunos"
      from curso c 
      inner join matricula m on m.id_curso = c.id_curso 
      inner join aluno a on a.id_aluno = m.id_aluno 
      group by c.id_curso 
    ) as numero
  );
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUERY 3: Selecionar quais pessoas facilitadoras atuam em mais de uma turma;

select count(tf.id_modulo), fa.nome  from modulo tf
INNER JOIN facilitador fa
ON tf.facilitador_soft = fa.id_facilitador
GROUP BY fa.id_facilitador
HAVING count(tf.facilitador_soft)>1
union
select count(tf.id_modulo) , fa.nome  from modulo tf
INNER JOIN facilitador fa
ON tf.facilitador_tech = fa.id_facilitador
GROUP BY fa.id_facilitador
HAVING count(tf.facilitador_tech)>1 ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
-- QUERY 4: Qual a quantidade de pessoas do gênero feminino que fizeram /fazem o curso de WebDev por turma?;

select web.nome,web.id_curso as numero_turma, count(web.id_aluno) as qtd_meninas
	from (
		select matricula.id_aluno, curso.id_curso, curso.nome
			from matricula 
			inner join curso
				on matricula.id_curso = curso.id_curso
			where curso.nome = 'WebDev Full Stack') as web
	inner join aluno
		on web.id_aluno = aluno.id_aluno
	where web.id_aluno = aluno.id_aluno and aluno.genero = 'Feminino'
	group by web.id_curso, web.nome
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

-- QUERY 5: Qual a quantidade de alunos que já finalizaram o curso de WebDev e Análise de Dados que já estão trabalhando na área tech?;


select count(matricula.id_matricula), curso.nome 
	from matricula
	inner join curso on curso.id_curso = matricula.id_curso
	inner join aluno on aluno.id_aluno = matricula.id_aluno
	where matricula.status='Concluído'
	and status_empregabilidade='Empregado - Tech'  
	group by curso.nome;
	

 --  5.a) Retorne quais são os estudantes de WebDev que se aplicam ao critério anterior;
 
 select matricula.id_matricula, aluno.nome
	from matricula 
	inner join aluno on aluno.id_aluno = matricula.id_aluno
	inner join curso on curso.id_curso = matricula.id_curso
	where matricula.status='Concluído'
	and status_empregabilidade='Empregado - Tech'
	and curso.nome='WebDev Full Stack';
	
	
--   5.b) Retorne quais são os estudantes de Análise de Dados que se aplicam ao critério anterior;

  select matricula.id_matricula, aluno.nome
	from matricula 
	inner join aluno on aluno.id_aluno = matricula.id_aluno
	inner join curso on curso.id_curso = matricula.id_curso
	where matricula.status='Concluído'
	and status_empregabilidade='Empregado - Tech'
	and curso.nome='Data Analytics';

 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUERY 6: Quantos alunos avaliados como "colocou tudo em prática" ou "provou seu diferencial" no projeto final do módulo 1 da(s) turma(s) atual(ais) de Data Analytics?.

select ntb.nota, ntb.qtd_notas
    from(
        select pf.nota_tech as nota, count(pf.nota_tech) as qtd_notas
            from projeto_final as pf
            inner join modulo as md
                on pf.id_modulo = md.id_modulo 
            inner join curso as cu
                on md.id_curso = cu.id_curso
            where cu.nome = 'Data Analytics' 
                and md.nivel  = '1º' 
                and cu.data_inicio < current_timestamp
                and cu.data_enceramento > current_timestamp
            group by nota) as ntb
    where nota = 4 or nota = 5 
    
    
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
-- QUERY 7: Existe diferença na quantidade de alunos inscritos se a turma for vespertina ou noturna?

select count(mt.id_matricula) as inscritos, cu.turno as turno
    from matricula as mt
    left join curso as cu
        on mt.id_curso = cu.id_curso
    group by turno
    
---------------------------------------------------------------------------FIM----------------------------------------------------------------------------------------
