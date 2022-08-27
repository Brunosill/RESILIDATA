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
  "curso_id" int,
  "status_empregabilidade" varchar(50)
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

CREATE TABLE "modulo" (
  "id_modulo" serial PRIMARY KEY,
  "id_curso" int,
  "nivel" int,
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

-- Criar relacionamentos:


ALTER TABLE "modulo" ADD FOREIGN KEY (facilitador_soft) REFERENCES facilitador ("id_facilitador");

ALTER TABLE "modulo" ADD FOREIGN KEY ("facilitador_tech") REFERENCES "facilitador" ("id_facilitador");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_aluno") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "matricula" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

ALTER TABLE "modulo" ADD FOREIGN KEY ("id_curso") REFERENCES "curso" ("id_curso");

-- Popular tabelas:

-- Popular tabela aluno:

INSERT INTO Aluno (cpf,nome,email,cep,cidade,estado,celular,data_nacimento,escolaridade,genero,etnia,curso_id,status_empregabilidade)
VALUES
('624.783.240-08','Carolina Márcia Sarah Jesus','carolina.jesus@outlook.com','29500970','Alegre','ES','(98)98319-4520','12/07/1990','Ensino Médio Completo','Feminino','negro','1','Em busca de emprego'),
('134.957.110-58','Sebastiana Isis Carvalho','sebastiana.carvalho@outlook.com','25251043','Duque de Caxias','RJ','(68)99648-6921','12/07/1990','Ensino Médio Completo','Não-binário','negro','2','Empregado - área tech'),
('319.725.970-00','Francisca Yasmin Rafaela Bernardes','francisca.bernardes@outlook.com','21843970','Rio de Janeiro','RJ','(61)97279-8964','12/07/1990','Ensino Médio Incompleto','Feminino','branco','3','Empregado'),
('376.133.930-54','Osvaldo Diogo Corte Real','osvaldo.real@outlook.com','68702180','Capanema','PA','(32)97936-3914','12/07/1990','Ensino Superior Completo','Masculino','indigena','4','Em busca de emprego'),
('548.636.900-02','Sarah Betina Eloá Galvão','sarah.galvao@outlook.com','89282545','São Bento do Sul','SC','(68)97524-4347','12/07/1990','Ensino Superior Completo','Feminino','negro','5','Em busca de emprego'),
('031.515.740-25','Bernardo Bento Nascimento','bernado.nascimento@outlook.com','29101360','Vila Velha','ES','(96)98769-7425','12/07/1990','Ensino Superiro Incompleto','Não-binário','branco','6','Em busca de emprego'),
('040.893.270-83','Manoel Benício Jorge Campos','manoel.campos@outlook.com','41307230','Salvador','BA','(84)98205-4547','12/07/1990','Ensino Médio Completo','Masculino','branco','7','Empregado - área não tech'),
('734.806.390-03','Milena Aurora Tatiane Melo','milena.melo@outlook.com','69098600','Manaus','AM','(66)99177-2628','12/07/1990','Ensino Fundamental Completo','Masculino','branco','8','Em busca de emprego'),
('243.520.230-00','Leandro Jorge Thomas Rocha','leandro.rocha@outlook.com','29500970','Alegre','ES','(93)96739-0536','12/07/1990','Ensino Médio Completo','Feminino','negro','9','Em busca de emprego'),
('544.528.720-34','Noah Elias Costa','noah.costa@outlook.com','59124010','Natal','RN','(11)98117-1891','12/07/1990','Ensino Médio Completo','Masculino','negro','10','Em busca de emprego'),
('335.833.950-50','Lucas Fábio da Paz','lucas.paz@outlook.com','13275650','Valinhos','SP','(77)98587-7351','12/07/1990','Ensino Médio Completo','Não-binário','branco','11','Em busca de emprego'),
('009.344.610-15','Elaine Silvana Jaqueline Santos','elaine.santos@outlook.com','17065411','Bauru','SP','(92)98260-1704','12/07/1990','Ensino Médio Completo','Feminino','negro','12','Em busca de emprego'),
('098.660.450-05','Fernanda Sebastiana Nogueira','fernanda.nogueira@outlook.com','12223400','São José dos Campos','SP','(96)96707-4750','12/07/1990','Ensino Médio Completo','Feminino','negro','13','Em busca de emprego'),
('738.985.310-74','Isabelly Carla da Luz','isabelly.luz@outlook.com','29500970','Alegre','ES','(24)98623-6788','12/07/1990','Ensino Médio Completo','Feminino','indigena','14','Empregado - área tech'),
('642.993.950-26','Gabrielly Antônia Rafaela da Mata','gabrielly.mata@outlook.com','21843970','Rio de Janeiro','RJ','(91)97146-9961','12/07/1990','Ensino Médio Incompleto','Feminino','negro','15','Em busca de emprego'),
('508.776.320-06','Hadassa Analu Stella Pereira','hadassa.perreira@outlook.com','68702180','Capanema','PA','(82)98752-3446','12/07/1990','Ensino Superior Completo','Feminino','branco','16','Em busca de emprego'),
('564.098.550-01','Filipe Márcio Nathan Gonçalves','filipe.goncalves@outlook.com','89282545','São Bento do Sul','SC','(84)99984-2612','12/07/1990','Ensino Médio Completo','Masculino','branco','17','Em busca de emprego'),
('054.596.290-04','Sarah Alana Freitas','sarah.freitas@outlook.com','29101360','Vila Velha','ES','(67)99813-1215','12/07/1990','Ensino Médio Completo','Feminino','branco','18','Em busca de emprego'),
('336.199.830-11','Anthony Manuel Barbosa','anthony.barbosa@outlook.com','78035565','Cuiabá','MT','(79)98880-7032','12/07/1990','Ensino Médio Completo','Masculino','negro','19','Em busca de emprego'),
('624.783.240-08', 'João Kauê Porto','joao.porto@outlook.com','76829312','Porto Velho','1','(62)98957-7116','12/07/1990','Ensino Médio Completo','Masculino','negro','20','Em busca de emprego');


 -- Popular tabela curso:
 
 
INSERT INTO curso (id_curso, nome,  data_inicio, data_enceramento, status, ementa, carga_horaria, turno, facilitador_soft, facilitador_tech)
VALUES 
('WebDev Full Stack', '2019-02-06', '2019-08-06', 'Concluído'   , 300, 'Vespertino', 7, 1), 
('Data Analytics'   , '2019-04-17', '2019-10-17', 'Concluído'   , 300, 'Vespertino', 8, 2),
('WebDev Full Stack', '2019-06-22', '2019-12-20', 'Concluído'   , 300, 'Noturno'   , 7, 2),
('Data Analytics'   , '2019-09-05', '2020-03-05', 'Concluído'   , 300, 'Noturno'   , 7, 4),
('WebDev Full Stack', '2019-12-11', '2020-05-12', 'Concluído'   , 300, 'Noturno'   , 7, 3),
('Data Analytics'   , '2020-03-15', '2020-09-18', 'Concluído'   , 300, 'Vespertino', 7, 5),
('WebDev Full Stack', '2020-06-24', '2020-12-28', 'Concluído'   , 300, 'Noturno'   , 9, 2),
('Data Analytics'   , '2020-08-20', '2021-02-25', 'Concluído'   , 300, 'Noturno'   , 9, 6),
('WebDev Full Stack', '2020-10-03', '2021-04-07', 'Concluído'   , 300, 'Noturno'   , 7, 3),
('Data Analytics'   , '2020-12-18', '2021-05-18', 'Concluído'   , 300, 'Vespertino', 8, 1),
('WebDev Full Stack', '2021-02-08', '2021-08-08', 'Concluído'   , 300, 'Noturno'   , 7, 2),
('Data Analytics'   , '2021-05-26', '2021-11-28', 'Concluído'   , 300, 'Noturno'   , 9, 4),
('WebDev Full Stack', '2021-09-26', '2022-03-30', 'Concluído'   , 300, 'Vespertino', 7, 3),
('Data Analytics'   , '2021-11-14', '2022-04-18', 'Concluído'   , 300, 'Vespertino',10, 1),
('WebDev Full Stack', '2021-12-20', '2022-05-20', 'Concluído'   , 300, 'Noturno'   , 9, 5),
('Data Analytics'   , '2022-01-30', '2022-08-01', 'Concluído'   , 360, 'Noturno'   ,10, 5),
('Data Analytics'   , '2022-03-02', '2022-09-05', 'Em Andamento', 360, 'Vespertino',10, 4),
('WebDev Full Stack', '2022-04-22', '2022-10-31', 'Em andamento', 360, 'Noturno'   ,10, 5),
('Data Analytics'   , '2022-05-16', '2022-11-18', 'Em andamento', 360, 'Vespertino', 7, 4),
('WebDev Full Stack', '2022-08-29', '2023-03-02', 'Em andamento', 360, 'Noturno'   , 8, 3),
('Data Analytics'   , '2023-01-17', '2023-07-18', 'Programado'  , 360, 'Noturno'   , 9, 3);

-- Popular tabela matricula:

-- Popular tabela modulo:
ABORTINSERT into modulo (id_curso, nivel, ementa, facilitador_soft, facilitador_tech, carga_horaria, status_modulo)
VALUES
('1', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '7', '1', 60, 'Concluído'),       
('1', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '7', '1', 60, 'Concluído'),       
('1', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '7', '1', 60, 'Concluído'),       
('1', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '7', '1', 60, 'Concluído'),    
('1', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '7', '1', 60, 'Concluído'),
('3', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '7', '2', 60, 'Concluído'),       
('3', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github. Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '7', '2', 60, 'Concluído'),       
('3', '3º', 'Hard:Modelagem de banco de dados com foco em BI. Soft: Metodologias Ágeis: SCRUM.', '7', '2', 60, 'Concluído'),       
('3', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '7', '2', 60, 'Concluído'),    
('3', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '7', '2', 60, 'Concluído'),     
('5', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '7', '3', 60, 'Concluído'),       
('5', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front=end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '7', '3', 60,  'Concluído'),       
('5', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '7', '3', 60 ,'Concluído'),       
('5', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '7', '3', 60,'Concluído'),    
('5', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '7', '3', 60, 'Concluído')    
('7', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '9', '2',60, 'Concluído'),       
('7', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '9', '2',60, 'Concluído'),       
('7', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '9', '2',60, 'Concluído'),       
('7', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '9', '2', 60, 'Concluído'),    
('7', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '9', '2',60,  'Concluído'),
('9', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '7', '3',60, 'Concluído'),       
('9', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '7', '3', 60,'Concluído'),       
('9', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '7', '3',60, 'Concluído'),       
('9', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '7', '3', 60,'Concluído'),    
('9', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '7', '3', 60,'Concluído'), 
('11', '1º','Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '7', '2',60, 'Concluído'),       
('11', '2º','Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '7', '2',60, 'Concluído'),       
('11', '3º','Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '7', '2', 60,'Concluído'),       
('11', '4º','Hard: Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '7', '2',60, 'Concluído'),    
('11', '5º','Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '7', '2', 60,'Concluído'),   
('13', '1º','Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '7', '3',60,  'Concluído'),       
('13', '2º','Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front - end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '7', '3', 60,'Concluído'),       
('13', '3º','Hard: Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '7', '3',60, 'Concluído'),       
('13', '4º','Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '7', '3', 60,'Concluído'),    
('13', '5º','Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '9', '5', 60, 'Concluído'), 
('15', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '9', '5', 60, 'Concluído'),       
('15', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '9', '5', 60,'Concluído'),       
('15', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '9', '5', 60,'Concluído'),       
('15', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '9', '5',60, 'Concluído'),    
('15', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '9', '5',60, 'Concluído'),  
('18', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '10', '5', 72,'Concluído'),       
('18', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '10', '5', 72,'Concluído'),       
('18', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '10', '5', 72, 'Concluído'),       
('18', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.', '10', '5', 72,'Em andamento'),    
('18', '5º', 'Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '10', '5', 72,'Não iniciado'),    
('20', '1º', 'Hard:Páginas estáticas com  HTML5 e CSS3, lógica de programação e Javascript, versionamento de código com Git e Github.Soft: Competências e hábitos para ser um protagonista do seu aprendizado.', '8', '3', 72, 'Em andamento'),       
('20', '2º', 'Hard:Páginas dinâmicas com POO em Javascript, projetos colaborativos de front end em Git e Github.Soft: Inteligência emocional, trabalho em equipe e relacionamento interpessoal.', '8', '3', 72, 'Não iniciado'),       
('20', '3º', 'Hard:Modelagem de banco de dados com foco em BI.Soft: Metodologias Ágeis: SCRUM.', '8', '3', 72, 'Não iniciado'),      
('20', '4º', 'Hard:Criação de APIs que interajam com banco de dados. Soft: Postura profissional, criatividade e inovação.' , '8', '3', 72,'Não iniciado'),    
('20', '5º', 'Hard:Hard:Frameworks, bibliotecas, tecnologias cliente-side front end. Soft: Foco em carreira e processo seletivo.', '8', '3',72, 'Não iniciado'),   
('2', '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '8','2',72, 'Concluído'),
('2', '2º',  'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '8','2',72, 'Concluído'),
('2', '3º',  'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '8','2', 72,'Concluído'),
('2', '4º',  'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '8','2', 72, 'Concluído'),
('2', '5º',  'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '8','2',72, 'Concluído'),
('4', '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '7','4',72, 'Concluído'),
('4', '2º',  'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '7','4', 72,'Concluído'),
('4', '3º',  'Hard: Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '7','4', 72, 'Concluído'),
('4', '4º',  'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '7','4',72, 'Concluído'),
('4', '5º',  'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '7','4',72, 'Concluído'),
('6', '1º',  'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '7','5', 72,'Concluído'),
('6', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '7','5', '72,Concluído'),
('6', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '7','5',72, 'Concluído'),
('6', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '7','5', 72, 'Concluído'),
('6', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '7','5',72 'Concluído'),
('8', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '9','6',72, 'Concluído'),
('8', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.','9','6',72, 'Concluído'),
('8', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '9','6', 72,'Concluído'),
('8', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '9','6', 72, 'Concluído'),
('8', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '9','6', 72,'Concluído'),
('10', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '8','1', 72,'Concluído'),
('10', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '8','1',72, 'Concluído'),
('10', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '8','1',72, 'Concluído'),
('10', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.','8','1',72, 'Concluído'),
('10', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '8','1',72, 'Concluído'),
('12', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '9','4', 72,'Concluído'),
('12', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '9','4', 72, 'Concluído'),
('12', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '9','4',72, 'Concluído'),
('12', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '9','4', 72, 'Concluído'),
('12', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '10','1', 72, 'Concluído'),
('14', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '10','1', 72 ,'Concluído'),
('14', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '10','1', 72,'Concluído'),
('14', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '10','1',72, 'Concluído'),
('14', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '10','1', 72, 'Concluído'),
('14', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '10','1', 72,'Concluído'),
('16', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '10','5',72, 'Concluído'),
('16', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '10','5',72, 'Concluído'),
('16', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '10','5',72, 'Concluído'),
('16', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '10','5',72, 'Concluído'),
('16', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '10','5', 72,'Concluído'),
('17', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '10','4',72, 'Concluído'),
('17', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '10','4', 72, 'Concluído'),
('17', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '10','4',72, 'Concluído'),
('17', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '10','4',72, 'Concluído'),
('17', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '10','4', 72,'Em andamento'),
('19', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '7','4',72, 'Concluído'),
('19', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '7','4',72, 'Concluído'),
('19', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '7','4',72, 'Em andamento'),
('19', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '7','4',72, 'Não iniciado'),
('19', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '7','4',72, 'Não iniciado'),
('21', '1º', 'Hard:Introdução à programação, algoritmo, pensamento computacional e Python (entrada/saída de dados, versionamento de código). Soft: Aprender a aprender, hábitos e técnicas de aprendizagem, gestão de tempo, uso estratégico do LinkedIn.', '9','3',72, 'Não iniciado'),
('21', '2º', 'Hard:Estrutura de dados como listas, dicionários, funções, procedimentos e métodos, bibliotecas de dados e ambientes virtuais. Soft: Inteligência emocional, preparação para processos seletivos e entrevistas.', '9','3',72,'Não iniciado'),
('21', '3º', 'Hard:Manipulação de dados estruturados com PostgreSQL. Soft: Dar e receber feedbacks de forma profissional, comunicação não violenta e relacionamento interpessoal.', '9','3',72,'Não iniciado'),
('21', '4º', 'Hard:Estatística descritiva e visualização de dados (Pandas, Google Colab). Soft: Metodologias ágeis: SCRUM.', '9','3',72,'Não iniciado'),
('21', '5º', 'Hard:Tratamento de dados, visualização com Tableau e storytelling. Soft: Visão de negócio, criatividade, inovação e resolução de problemas.', '9','3',72,'Não iniciado');
 
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
 
 
 
-- QUERIES:
 
--  QUERY 1: Selecionar a quantidade total de estudantes cadastrados no banco;
 
-- QUERY 2: Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
 
-- QUERY 3: Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
 
-- QUERY 4: Qual a quantidade de pessoas do gênero feminino que fizeram /fazem o curso de WebDev por turma?;
 
-- QUERY 5: Qual a quantidade de alunos que já finalizaram o curso de WebDev e Análise de Dados que já estão trabalhando na área tech?;
 
-- QUERY 6: Qual a porcentagem de alunos avaliados como "colocou tudo em prática" e "provou seu diferencial" no projeto final do módulo 2 da turma atual de Data Analytics?.
