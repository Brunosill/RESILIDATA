-- Criar tabela aluno:

CREATE TABLE "aluno" (
  "id_aluno" serial PRIMARY KEY,
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
  "id_curso" serial PRIMARY KEY,
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
  "id_modulo" serial PRIMARY KEY,
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
  "id_facilitador" serial PRIMARY KEY,
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

INSERT INTO Aluno (id_aluno,cpf,nome,email,cep,cidade,estado,celular,data_nacimento,escolaridade,genero,etnia,curso_id,status_empregabilidade)
VALUES
('624.783.240-08','Carolina Márcia Sarah Jesus','carolina.jesus@outlook.com','29500970','Alegre','ES','(98)98319-4520','1990-07-12','Ensino Médio Completo','Feminino','negro','1','Buscando Emprego'),
('134.957.110-58','Sebastiana Isis Carvalho','sebastiana.carvalho@outlook.com','25251043','Duque de Caxias','RJ','(68)99648-6921','1990-09-25','Ensino Médio Completo','Não-binário','negro','2','Empregado - Tech'),
('319.725.970-00','Francisca Yasmin Rafaela Bernardes','francisca.bernardes@outlook.com','21843970','Rio de Janeiro','RJ','(61)97279-8964','2001-10-28','Ensino Médio Incompleto','Feminino','branco','3','Empregado - Tech'),
('376.133.930-54','Osvaldo Diogo Corte Real','osvaldo.real@outlook.com','68702180','Capanema','PA','(32)97936-3914','1991-07-02','Ensino Superior Completo','Masculino','indigena','4','Buscando Emprego'),
('548.636.900-02','Sarah Betina Eloá Galvão','sarah.galvao@outlook.com','89282545','São Bento do Sul','SC','(68)97524-4347','1996-04-17','Ensino Superior Completo','Feminino','negro','5','Buscando Emprego'),
('031.515.740-25','Bernardo Bento Nascimento','bernado.nascimento@outlook.com','29101360','Vila Velha','ES','(96)98769-7425','2000-11-18','Ensino Superiro Incompleto','Não-binário','branco','6','Buscando Emprego'),
('040.893.270-83','Manoel Benício Jorge Campos','manoel.campos@outlook.com','41307230','Salvador','BA','(84)98205-4547','1991-11-19','Ensino Médio Completo','Masculino','branco','7','Empregado - Tech'),
('734.806.390-03','Milena Aurora Tatiane Melo','milena.melo@outlook.com','69098600','Manaus','AM','(66)99177-2628','12-07-1990','Ensino Fundamental Completo','Masculino','branco','8','Buscando Emprego'),
('243.520.230-00','Leandro Jorge Thomas Rocha','leandro.rocha@outlook.com','29500970','Alegre','ES','(93)96739-0536',''2000-02-23,'Ensino Médio Completo','Feminino','negro','9','Buscando Emprego'),
('544.528.720-34','Noah Elias Costa','noah.costa@outlook.com','59124010','Natal','RN','(11)98117-1891','2002-11-15','Ensino Médio Completo','Masculino','negro','10','Buscando Emprego'),
('335.833.950-50','Lucas Fábio da Paz','lucas.paz@outlook.com','13275650','Valinhos','SP','(77)98587-7351','1996-03-01','Ensino Médio Completo','Não-binário','branco','11','Buscando Emprego'),
('009.344.610-15','Elaine Silvana Jaqueline Santos','elaine.santos@outlook.com','17065411','Bauru','SP','(92)98260-1704','2001-04-11','Ensino Médio Completo','Feminino','negro','12','Buscando Emprego'),
('098.660.450-05','Fernanda Sebastiana Nogueira','fernanda.nogueira@outlook.com','12223400','São José dos Campos','SP','(96)96707-4750','1994-11-26','Ensino Médio Completo','Feminino','negro','13','Buscando Emprego'),
('738.985.310-74','Isabelly Carla da Luz','isabelly.luz@outlook.com','29500970','Alegre','ES','(24)98623-6788','1996-01-05','Ensino Médio Completo','Feminino','indigena','14','Empregado - Tech'),
('642.993.950-26','Gabrielly Antônia Rafaela da Mata','gabrielly.mata@outlook.com','21843970','Rio de Janeiro','RJ','(91)97146-9961','12-07-1990','Ensino Médio Incompleto','Feminino','negro','15','Buscando Emprego'),
('508.776.320-06','Hadassa Analu Stella Pereira','hadassa.perreira@outlook.com','68702180','Capanema','PA','(82)98752-3446','1993-10-14','Ensino Superior Completo','Feminino','branco','16','Buscando Emprego'),
('564.098.550-01','Filipe Márcio Nathan Gonçalves','filipe.goncalves@outlook.com','89282545','São Bento do Sul','SC','(84)99984-2612','1991-12-25','Ensino Médio Completo','Masculino','branco','17','Buscando Emprego'),
('054.596.290-04','Sarah Alana Freitas','sarah.freitas@outlook.com','29101360','Vila Velha','ES','(67)99813-1215','1996-08-11','Ensino Médio Completo','Feminino','branco','18','Buscando Emprego'),
('336.199.830-11','Anthony Manuel Barbosa','anthony.barbosa@outlook.com','78035565','Cuiabá','MT','(79)98880-7032',''1991-12-20,'Ensino Médio Completo','Masculino','negro','19','Buscando Emprego'),
('624.783.240-08','João Kauê Porto','joao.porto@outlook.com','76829312','Porto Velho','1','(62)98957-7116','1997-11-28','Ensino Médio Completo','Masculino','negro','20','Buscando Emprego');
('410.468.538-48','Imani Hull','imanihull3339@aol.edu','67335-295','Parauapebas','Pará','(67)14666-2379','1993-04-12','Ensino Médio Completo','feminino','branco','7','Buscando Emprego'),
('159.612.404-19','Aphrodite Noel','aphroditenoel@aol.com','66419-102','Cametá','Pará','(41)26114-2467','1994-10-24','Ensino Superior Incompleto','masculino','indígena','6','Empregado - Tech'),
('733.648.858-90','Sydnee Bentley','sydneebentley@outlook.org','97441-468','Novo Hamburgo','Rio Grande do Sul','(21)38694-2374','1993-10-14','Ensino Superior Completo','masculino','negro','12','Empregado - Não Tech'),
('034.631.518-44','Alec Murray','alecmurray@protonmail.org','76741-401','Goiânia','Goiás','(39)29321-3513','2002-05-20','Ensino Médio Completo','feminino','branco ','7','Empregado - Tech'),
('558.608.525-53','Driscoll Erickson','driscollerickson4379@icloud.net','83768-056','Foz do Iguaçu','Paraná','(34)67936-2018','1994-11-26','Ensino Médio Completo','masculino','negro','19','Buscando Emprego'),
('037.101.211-65','Ferdinand Conrad','ferdinandconrad@icloud.net','21248-132','Petrópolis','Rio de Janeiro','(21)71229-7858','1994-08-07','Ensino Superior Incompleto','masculino','branco','6','Empregado - Tech'),
('277.955.328-17','Alika Pittman','alikapittman7519@google.edu','34674466','Juiz de Fora','Minas Gerais','(72)27054-5407','1999-07-23','Ensino Superior Completo','feminino','indígena','2','Empregado - Não Tech'),
('311.888.637-17','Lewis Ashley','lewisashley@hotmail.ca','66336-618','Santarém','Pará','(34)38504-2354','1999-12-10','Ensino Médio Completo','masculino','negro','18','Empregado - Tech'),
('733.065.348-68','Clayton Hebert','claytonhebert@icloud.org','65547-266','Timon','Maranhão','(15)33413-2556','1991-07-23','Ensino Médio Completo','masculino','branco ','10','Buscando Emprego'),
('141.678.101-62','Grace Roach','graceroach7526@hotmail.edu','34366841','Governador Valadares','Minas Gerais','(84)98275-7598','1991-11-15','Ensino Superior Incompleto','feminino','negro','12','Empregado - Tech'),
('871.521.154-30','Drake Jones','drakejones@hotmail.net','44742-560','Lauro de Freitas','Bahia','(58)61814-0384','1997-11-15','Ensino Superior Completo','masculino','branco','12','Empregado - Não Tech'),
('364.833.157-18','Camden Buck','camdenbuck2578@google.edu','19532-156','Campinas','São Paulo','(82)78886-5576','1996-01-05','Ensino Médio Completo','masculino','indígena','10','Empregado - Tech'),
('462.889.414-78','Hilary Mullins','hilarymullins5608@google.net','75711-735','Aparecida de Goiânia','Goiás','(65)61606-2628','1997-10-24','Ensino Médio Completo','feminino','negro','4','Buscando Emprego'),
('875.524.616-36','Hakeem Jensen','hakeemjensen@aol.couk','86863-772','Maringá','Paraná','(28)37845-0258','1997-10-07','Ensino Superior Incompleto','masculino','branco ','18','Empregado - Tech'),
('518.227.840-67','Samuel Bentley','samuelbentley2747@protonmail.ca','27274-274','Petrópolis','Rio de Janeiro','(40)16739-2669','1991-12-25','Ensino Superior Completo','masculino','negro','4','Empregado - Não Tech'),
('558.141.752-39','Octavia Oneil','octaviaoneil2693@google.com','58584-175','Cajazeiras','Paraíba','(22)14432-3008','1997-09-25','Ensino Médio Completo','feminino','branco','2','Empregado - Tech'),
('743.093.424-00','Fritz Cervantes','fritzcervantes9225@google.edu','87632-515','Guarapuava','Paraná','(42)24102-0189','1992-09-29','Ensino Médio Completo','masculino','indígena','4','Buscando Emprego'),
('189.973.118-62','Velma Roman','velmaroman@icloud.net','24636-651','São João de Meriti','Rio de Janeiro','(62)64848-2252','1994-10-30','Ensino Superior Incompleto','masculino','negro','8','Empregado - Tech'),
('051.513.544-78','Penelope Woods','penelopewoods@icloud.couk','60247-615','Itapipoca','Ceará','(81)87684-2424','1999-07-22','Ensino Superior Completo','feminino','branco ','5','Empregado - Não Tech'),
('226.551.268-21','Octavia Sosa','octaviasosa9636@icloud.edu','68646-582','Ananindeua','Pará','(33)58435-7732','1997-08-28','Ensino Médio Completo','masculino','negro','12','Empregado - Tech'),
('387.467.873-59','Ora Dale','oradale@aol.com','42846-529','Camaçari','Bahia','(52)10103-6782','2002-11-16','Ensino Médio Completo','masculino','branco','10','Buscando Emprego'),
('726.112.033-71','Ira Buckley','irabuckley1866@google.couk','65628-820','Codó','Maranhão','(95)89267-8393','2003-01-01','Ensino Superior Incompleto','feminino','indígena','9','Empregado - Tech'),
('752.256.894-54','Carol Alvarado','carolalvarado1179@hotmail.ca','74741-415','Aparecida de Goiânia','Goiás','(72)56663-8282','1999-10-21','Ensino Superior Completo','masculino','negro','16','Empregado - Não Tech'),
('165.153.811-08','Ariel Cochran','arielcochran@google.couk','32240042','Santa Luzia','Minas Gerais','(15)71888-5447','1998-10-04','Ensino Médio Completo','masculino','branco ','19','Empregado - Tech'),
('303.551.362-77','Raphael Armstrong','raphaelarmstrong1972@protonmail.edu','32856505','Uberlândia','Minas Gerais','(34)28219-3733','1996-12-28','Ensino Médio Completo','feminino','negro','9','Buscando Emprego'),
('967.814.085-42','Willa Rodgers','willarodgers@yahoo.net','75743-767','Valparaíso de Goiás','Goiás','(18)62153-1702','1990-07-05','Ensino Superior Incompleto','masculino','branco','4','Empregado - Tech'),
('883.232.419-43','Christopher Larson','christopherlarson@outlook.net','26946-133','Duque de Caxias','Rio de Janeiro','(61)61187-2353','1998-02-02','Ensino Superior Completo','masculino','indígena','11','Empregado - Não Tech'),
('835.312.257-92','Alden Mayer','aldenmayer@protonmail.ca','88460-882','São José','Santa Catarina','(77)52605-5913','2001-03-21','Ensino Médio Completo','feminino','negro','19','Empregado - Tech'),
('503.340.749-39','Christen Marks','christenmarks6880@icloud.ca','27218-422','Belford Roxo','Rio de Janeiro','(06)15466-4075','1996-03-01','Ensino Médio Completo','masculino','branco ','3','Buscando Emprego'),
('681.582.353-39','Kevin Finley','kevinfinley@yahoo.com','19769-879','Mauá','São Paulo','(71)06135-1959','1990-08-26','Ensino Superior Incompleto','masculino','negro','18','Empregado - Tech'),
('896.736.335-22','Iris Mcconnell','irismcconnell9470@outlook.org','27216-727','São João de Meriti','Rio de Janeiro','(43)34268-3830','2001-04-11','Ensino Superior Completo','feminino','branco','6','Empregado - Não Tech'),
('769.719.589-87','Mari Farmer','marifarmer282@google.com','58428-126','Bayeux','Paraíba','(54)06344-8514','2001-11-02','Ensino Médio Completo','masculino','indígena','14','Empregado - Tech'),
('611.462.289-48','Ashton Stokes','ashtonstokes3956@hotmail.couk','42895-293','Juazeiro','Bahia','(37)57241-3848','1993-01-26','Ensino Médio Completo','masculino','negro','14','Buscando Emprego'),
('948.068.738-82','Amaya Golden','amayagolden@protonmail.net','55445-165','Olinda','Pernambuco','(64)78287-7760','2002-11-15','Ensino Superior Incompleto','feminino','branco ','8','Empregado - Tech'),
('281.492.818-28','Axel Mitchell','axelmitchell3616@yahoo.ca','76780-134','Anápolis','Goiás','(21)03738-3266','2001-09-21','Ensino Superior Completo','masculino','negro','16','Empregado - Não Tech'),
('324.592.637-35','Hayes Mann','hayesmann8383@icloud.edu','24180-898','São Gonçalo','Rio de Janeiro','(11)68400-1196','2001-08-20','Ensino Médio Completo','masculino','branco','12','Empregado - Tech'),
('327.484.787-41','Kelsie Hodge','kelsiehodge903@hotmail.org','61511-568','Itapipoca','Ceará','(56)27598-5184','1999-04-24','Ensino Médio Completo','feminino','indígena','18','Buscando Emprego'),
('918.232.660-85','Ulric Clarke','ulricclarke@icloud.ca','26558-115','Duque de Caxias','Rio de Janeiro','(13)12363-7726','1997-07-31','Ensino Superior Incompleto','masculino','negro','4','Empregado - Tech'),
('415.622.531-57','Carlos Schroeder','carlosschroeder@hotmail.ca','60169-758','Sobral','Ceará','(24)94363-4462','2000-01-10','Ensino Superior Completo','masculino','branco ','15','Empregado - Não Tech'),
('520.588.627-64','Cruz Crawford','cruzcrawford@icloud.edu','87291-387','Paranaguá','Paraná','(23)36062-6551','1993-07-15','Ensino Médio Completo','feminino','negro','6','Empregado - Tech'),
('775.323.799-70','Venus Dunlap','venusdunlap50@hotmail.ca','81397-645','Maringá','Paraná','(82)37488-4530','1995-11-26','Ensino Médio Completo','masculino','branco','16','Buscando Emprego'),
('179.454.747-53','Malik Dale','malikdale@google.edu','58786-314','Campina Grande','Paraíba','(64)65851-8724','1996-03-31','Ensino Superior Incompleto','masculino','indígena','6','Empregado - Tech'),
('725.486.194-78','Ulla Mcknight','ullamcknight2267@hotmail.com','25525-333','Rio de Janeiro','Rio de Janeiro','(50)52760-9071','1993-09-22','Ensino Superior Completo','feminino','negro','13','Empregado - Não Tech'),
('795.946.377-49','Axel Rivas','axelrivas2613@icloud.ca','93313-743','Caxias do Sul','Rio Grande do Sul','(46)62863-3747','2001-10-05','Ensino Médio Completo','masculino','branco ','8','Empregado - Tech'),
('713.112.761-48','Fletcher Strickland','fletcherstrickland6015@hotmail.ca','55785-868','Camaragibe','Pernambuco','(04)16494-7228','1997-01-23','Ensino Médio Completo','masculino','negro','18','Buscando Emprego'),
('023.163.944-59','Colby Villarreal','colbyvillarreal8124@hotmail.ca','11113-967','Carapicuíba','São Paulo','(86)27880-4513','1991-04-09','Ensino Superior Incompleto','feminino','branco','10','Empregado - Tech'),
('486.258.057-54','Dylan Garza','dylangarza3968@google.couk','87597-758','Cascavel','Paraná','(62)15448-3227','1996-02-03','Ensino Superior Completo','masculino','indígena','10','Empregado - Não Tech'),
('526.046.712-38','Reece Long','reecelong@hotmail.edu','54358-418','Cabo de Santo Agostinho','Pernambuco','(13)07538-6761','1989-10-19','Ensino Médio Completo','masculino','negro','16','Empregado - Tech'),
('755.151.213-54','Jarrod Phillips','jarrodphillips6318@aol.net','32167142','Uberaba','Minas Gerais','(15)52771-5173','1991-07-23','Ensino Médio Completo','feminino','branco ','1','Buscando Emprego'),
('164.742.553-56','Hu Duran','huduran@aol.ca','50231-706','Olinda','Pernambuco','(48)46366-2776','1990-06-12','Ensino Superior Incompleto','masculino','negro','18','Empregado - Tech'),
('261.974.481-82','Marah Beach','marahbeach@aol.ca','67152-275','Ananindeua','Pará','(88)28496-1489','1996-03-21','Ensino Superior Completo','masculino','branco','16','Empregado - Não Tech'),
('464.594.617-43','Vivian Terrell','vivianterrell2892@google.ca','67479-751','Bragança','Pará','(11)77161-3054','1996-08-11','Ensino Médio Completo','feminino','indígena','15','Empregado - Tech'),
('712.237.605-91','Karleigh Parsons','karleighparsons@aol.couk','85345-153','São José dos Pinhais','Paraná','(78)25255-4417','1991-12-20','Ensino Médio Completo','masculino','negro','15','Buscando Emprego'),
('137.845.174-62','Elliott Brock','elliottbrock@yahoo.net','66570-570','Castanhal','Pará','(11)46808-1220','1989-09-20','Ensino Superior Incompleto','masculino','branco ','10','Empregado - Tech'),
('428.486.815-27','Camilla Navarro','camillanavarro@google.edu','67023-443','Abaetetuba','Pará','(78)74667-4426','1990-09-25','Ensino Superior Completo','feminino','negro','2','Empregado - Não Tech'),
('713.504.112-82','Calvin Gay','calvingay303@yahoo.edu','58104-785','Santa Rita','Paraíba','(77)99498-2657','1992-12-29','Ensino Médio Completo','masculino','branco','5','Empregado - Tech'),
('581.474.992-01','Leonard Lindsay','leonardlindsay3256@outlook.com','61835-844','Fortaleza','Ceará','(32)53585-1715','1992-06-30','Ensino Médio Completo','masculino','indígena','12','Buscando Emprego'),
('631.264.384-95','Mara Raymond','mararaymond7558@google.ca','43085-496','Vitória da Conquista','Bahia','(25)05640-6457','1994-06-25','Ensino Superior Incompleto','feminino','negro','13','Empregado - Tech'),
('345.912.047-76','Leah Acevedo','leahacevedo3543@google.org','67525-560','Castanhal','Pará','(64)61432-5781','1995-05-08','Ensino Superior Completo','masculino','branco ','8','Empregado - Não Tech'),
('343.632.234-13','Neil Kidd','neilkidd@aol.org','91525-111','Novo Hamburgo','Rio Grande do Sul','(46)85496-6708','1998-02-28','Ensino Médio Completo','masculino','negro','13','Empregado - Tech'),
('345.865.488-54','Alden Lester','aldenlester3634@icloud.ca','58435-666','João Pessoa','Paraíba','(71)12635-3579','2001-10-28','Ensino Médio Completo','feminino','branco','7','Buscando Emprego'),
('651.372.929-82','Lara Hawkins','larahawkins@icloud.ca','52189-771','Cabo de Santo Agostinho','Pernambuco','(57)21863-1355','1991-08-22','Ensino Superior Incompleto','masculino','indígena','17','Empregado - Tech'),
('991.961.862-97','Iola Evans','iolaevans234@outlook.ca','65359-135','Imperatriz','Maranhão','(22)98592-2671','1992-11-14','Ensino Superior Completo','masculino','negro','7','Empregado - Não Tech'),
('862.794.641-62','Willow Forbes','willowforbes@aol.com','88763-935','Itajaí','Santa Catarina','(67)46723-4938','1992-10-11','Ensino Médio Completo','feminino','branco ','8','Empregado - Tech'),
('757.246.161-69','Keaton Rogers','keatonrogers@icloud.couk','84196-356','Guarapuava','Paraná','(62)44917-3174','1997-11-28','Ensino Médio Completo','masculino','negro','18','Buscando Emprego'),
('433.298.787-41','Demetria Little','demetrialittle3521@aol.couk','52297-985','Camaragibe','Pernambuco','(25)09231-8372','1996-04-17','Ensino Superior Incompleto','masculino','branco','9','Empregado - Tech'),
('268.755.777-02','Igor Byrd','igorbyrd6140@outlook.org','32108984','Uberlândia','Minas Gerais','(82)12317-8875','1993-06-06','Ensino Superior Completo','feminino','indígena','11','Empregado - Não Tech'),
('967.068.496-22','Steel Riley','steelriley@outlook.net','80054-431','Ponta Grossa','Paraná','(99)85984-6989','2001-02-04','Ensino Médio Completo','masculino','negro','3','Empregado - Tech'),
('747.154.610-33','Abbot Parsons','abbotparsons@hotmail.edu','65061-643','Balsas','Maranhão','(62)05574-8231','2000-11-18','Ensino Médio Completo','masculino','branco ','6','Buscando Emprego'),
('715.206.769-71','Karleigh Stout','karleighstout@protonmail.net','52660-566','Olinda','Pernambuco','(61)92337-7015','2000-11-21','Ensino Superior Incompleto','feminino','negro','7','Empregado - Tech'),
('258.104.220-96','Brenna Shaffer','brennashaffer8126@aol.edu','33534438','Juiz de Fora','Minas Gerais','(87)32964-3737','1992-10-04','Ensino Superior Completo','masculino','branco','10','Empregado - Não Tech'),
('258.406.335-36','Oren Buchanan','orenbuchanan470@protonmail.org','53138-794','Jaboatão dos Guararapes','Pernambuco','(68)66283-2201','1991-11-19','Ensino Médio Completo','masculino','indígena','4','Empregado - Tech'),
('513.636.857-23','Palmer Gonzales','palmergonzales@aol.com','43586-144','Lauro de Freitas','Bahia','(17)25587-4438','2000-02-23','Ensino Médio Completo','feminino','negro','14','Buscando Emprego'),
('275.874.848-58','Wendy Price','wendyprice@yahoo.edu','65580-135','Paço do Lumiar','Maranhão','(39)16295-6112','1997-11-12','Ensino Superior Incompleto','masculino','branco ','10','Empregado - Tech'),
('183.899.747-82','Lillian Baker','lillianbaker609@yahoo.org','17803-146','Jundiaí','São Paulo','(65)27237-3416','1999-11-28','Ensino Superior Completo','masculino','negro','19','Empregado - Não Tech'),
('657.143.707-14','Oren Snider','orensnider221@outlook.net','17443-870','Jundiaí','São Paulo','(96)78152-8668','1990-01-12','Ensino Médio Completo','feminino','branco','10','Empregado - Tech'),
('303.543.667-29','Fleur Morse','fleurmorse@aol.edu','75737-271','Luziânia','Goiás','(30)14428-8664','1991-12-12','Ensino Médio Completo','masculino','indígena','2','Buscando Emprego'),
('618.332.204-47','Hayfa Donaldson','hayfadonaldson@protonmail.net','97529-834','Porto Alegre','Rio Grande do Sul','(52)58378-9693','2000-05-03','Ensino Superior Incompleto','masculino','negro','6','Empregado - Tech'),
('161.396.587-59','Charde Kinney','chardekinney@google.edu','39518841','Ipatinga','Minas Gerais','(75)74366-4434','1989-12-12','Ensino Superior Completo','feminino','branco ','6','Empregado - Não Tech'),
('714.866.985-26','Clio Donovan','cliodonovan@yahoo.net','83942-822','Cascavel','Paraná','(48)63534-6316','1996-08-03','Ensino Médio Completo','masculino','negro','12','Empregado - Tech');

-- Popular tabela curso:

INSERT INTO curso (id_curso, nome,  data_inicio, data_enceramento, status, ementa, carga_horaria, turno, monitor_soft, monitor_tech)
VALUES 
('WebDev Full Stack', '2019-02-06', '2019-08-06', 'Concluído'   , 672, 'Vespertino', 7, 1), 
('Data Analytics'   , '2019-04-17', '2019-10-17', 'Concluído'   , 650, 'Vespertino', 8, 2),
('WebDev Full Stack', '2019-06-22', '2019-12-20', 'Concluído'   , 696, 'Noturno'   , 7, 2),
('Data Analytics'   , '2019-09-05', '2020-03-05', 'Concluído'   , 579, 'Noturno'   , 7, 4),
('WebDev Full Stack', '2019-12-11', '2020-05-12', 'Concluído'   , 541, 'Noturno'   , 7, 3),
('Data Analytics'   , '2020-03-15', '2020-09-18', 'Concluído'   , 563, 'Vespertino', 7, 5),
('WebDev Full Stack', '2020-06-24', '2020-12-28', 'Concluído'   , 600, 'Noturno'   , 9, 2),
('Data Analytics'   , '2020-08-20', '2021-02-25', 'Concluído'   , 609, 'Noturno'   , 9, 6),
('WebDev Full Stack', '2020-10-03', '2021-04-07', 'Concluído'   , 591, 'Noturno'   , 7, 3),
('Data Analytics'   , '2020-12-18', '2021-05-18', 'Concluído'   , 581, 'Vespertino', 8, 1),
('WebDev Full Stack', '2021-02-08', '2021-08-08', 'Concluído'   , 656, 'Noturno'   , 7, 2),
('Data Analytics'   , '2021-05-26', '2021-11-28', 'Concluído'   , 650, 'Noturno'   , 9, 4),
('WebDev Full Stack', '2021-09-26', '2022-03-30', 'Concluído'   , 660, 'Vespertino', 7, 3),
('Data Analytics'   , '2021-11-14', '2022-04-18', 'Concluído'   , 615, 'Vespertino',10, 1),
('WebDev Full Stack', '2021-12-20', '2022-05-20', 'Concluído'   , 632, 'Noturno'   , 9, 5),
('Data Analytics'   , '2022-01-30', '2022-08-01', 'Concluído'   , 678, 'Noturno'   ,10, 5),
('Data Analytics'   , '2022-03-02', '2022-09-05', 'Em Andamento', 657, 'Vespertino',10, 4),
('WebDev Full Stack', '2022-04-22', '2022-10-31', 'Em andamento', 604, 'Noturno'   ,10, 5),
('Data Analytics'   , '2022-05-16', '2022-11-18', 'Em andamento', 682, 'Vespertino', 7, 4),
('WebDev Full Stack', '2022-08-29', '2023-03-02', 'Em andamento', 650, 'Noturno'   , 8, 3),
('Data Analytics'   , '2023-01-17', '2023-07-18', 'Programado'  , 650, 'Noturno'   , 9, 3);

-- Popular tabela matricula:
-- Popular tabela modulo:


-- Popular tabela facilitador:

INSERT INTO facilitador (id_facilitador,nome,cpf,area)
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




