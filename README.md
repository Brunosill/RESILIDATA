## Projeto-Resilia-3
# Banco de Dados - Resilia
- **Meu deus, eu não entendo nada de banco de dados, o que é isso que vocês fizeram ?**

   Calma lá que eu vou te explicar, nossa equipe fez a coleta de dados de vários setores diferentes da Resilia ( alunos, facilitadores, cursos, etc... )
   e colocamos tudo isso muito bonitinho dentro de tabelas, para facilitar a procura e gestão de dados dentro da empresa, agilizando assim processos que antes
   demandariam horas.

- **Tudo bem, já entendi, mas quem faz parte da sua equipe ?**

   Bem, a nossa equipe é composta por:
  
   - [Aline Ester ](https://github.com/enilaester)
   - [Ana Carolina](https://github.com/amoralles)
   - [Bruno Guedes](https://github.com/Brunosill)
   - [Isabelle Cavalcante](https://github.com/isa-sputnik)
   - [Laura Camargo](https://github.com/LauraCamargo-tech)
  
   Somos todos estudantes da [Resilia Educação](https://www.resilia.com.br/), cursando Análise de Dados, possivelmente um dia seremos analistas de dados.
 
 - **Ok, vocês provavelmente fizeram um belo trabalho em equipe, dá pra mostrar como ficou o banco de dados ?**
 
   Sim, vamos  mostrar pra você, uma forma bem fácil de se visualizar dados, é com diagramas! Saca só o nosso:
   
   Esse aqui é nosso diagrama relacional:
   ![img](https://i.imgur.com/CJ9fcs9.png)
   
   E esse aqui nosso diagrama lógico:
   ![img](https://i.imgur.com/xs38oaZ.png)
   
   Neles você consegue verificar todas as chaves primárias e estrangeiras, e como elas se relacionam dentro do banco de dados.
   
 - **Nossa, ficou espetacular, aposto que vocês vão tirar a avaliação máxima nisso aí, e como vocês fazem as consultas nisso ?**
 
   Então, todo o banco foi implementado dentro de um programinha chamado [PostgreSQL](https://www.postgresql.org/), é um programa que lê, executa e armazena
   scripts SQL, que nada mais são que linhas de código que fazem a inserção de informação dentro de uma base de dados.
   
   Por meio desses scripts, é possível tanto inserir novas informações, visualizar o que contém o nosso banco e fazer pesquisas
   absolutamente personalizáveis, a fim de trazer respostas claras e precisas.
   
   Alguns exemplos de perguntas feitas ao banco e seus scripts:
   
   **Selecionar a quantidade total de estudantes cadastrados no banco;**
   ```
    select count(id_aluno) as "Número de alunos" from aluno;
   ```

   **Selecionar todos os estudantes e seus respectivos cursos;**
   ```
    select aluno.nome as "Aluno", curso.nome as "Curso"
    from aluno
    inner join matricula on matricula.id_aluno = aluno.id_aluno
    inner join curso on curso.id_curso = matricula.id_curso;
   ```
  
   **Quantos alunos cadastrados por curso ?;**
   ```
  select c.nome, c.id_curso , count(m.id_aluno) as "Numero de alunos por curso"  from curso c 
  inner join matricula as m  on m.id_curso  = c.id_curso 
  inner join aluno as a  on a.id_aluno = m.id_aluno
  group by c.id_curso 
  order by c.id_curso;
   ```
   **Qual curso tem mais alunos cadastrados ?;**
   ```
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
   ```

   **Selecionar quais pessoas facilitadoras atuam em mais de uma turma;**
   ```

   ```
  
   **Qual a quantidade de pessoas do gênero feminino que fizeram /fazem o curso de WebDev por turma ?;**
   ```
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
    ```
    
**Qual a quantidade de alunos que já finalizaram o curso de WebDev e Análise de Dados e que já estão trabalhando na área tech ?;**
```
   select count(matricula.id_matricula), curso.nome 
	from matricula
	inner join curso on curso.id_curso = matricula.id_curso
	inner join aluno on aluno.id_aluno = matricula.id_aluno
	where matricula.status='Concluído'
	and status_empregabilidade='Empregado - Tech'  
	group by curso.nome;
	
```
**Retorne quais são os estudantes de WebDev que se aplicam ao critério anterior:**;
```
   select matricula.id_matricula, aluno.nome
	from matricula 
	inner join aluno on aluno.id_aluno = matricula.id_aluno
	inner join curso on curso.id_curso = matricula.id_curso
	where matricula.status='Concluído'
	and status_empregabilidade='Empregado - Tech'
	and curso.nome='WebDev Full Stack';
```
 **Retorne quais são os estudantes de Análise de Dados que se aplicam ao critério anterior**;
 ```
   select matricula.id_matricula, aluno.nome
	from matricula 
	inner join aluno on aluno.id_aluno = matricula.id_aluno
	inner join curso on curso.id_curso = matricula.id_curso
	where matricula.status='Concluído'
	and status_empregabilidade='Empregado - Tech'
	and curso.nome='Data Analytics';
 ```
 **Quantos alunos avaliados como "colocou tudo em prática" ou "provou seu diferencial" no projeto final do módulo 1 da(s) turma(s) atual(ais) de Data Analytics?**;
 ```
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
 ```
 **Existe diferença na quantidade de alunos inscritos se a turma for vespertina ou noturna ?**;
 ```
 select count(mt.id_matricula) as inscritos, cu.turno as turno
    from matricula as mt
    left join curso as cu
        on mt.id_curso = cu.id_curso
    group by turno
 ```
 -  **E como eu faço para testar o repositório de vocês aqui no meu PC?!**
  
    É só seguir os seguintes passos, olha só como é fácil:
    
    1º - Clonando o repositório para a sua máquina:
    - Copie a URL: https://github.com/Brunosill/RESILIDATA.git
    - Execute o seu [Git Bash](https://git-scm.com/downloads)
     - Escolha o diretório que desejar clonar o repositório 
    - Digite: git clone https://github.com/Brunosill/RESILIDATA.git
     - Pressione enter e pronto! 
     - E em caso de dúvidas, vale a pena olhar a [documentação sobre clonagem, ](https://docs.github.com/pt/repositories/creating-and-managing-repositories/cloning-a-repository)hein? 
     
     2º  - Instalar o PostgreSQL. Acesse o [tutorial](https://docs.google.com/document/d/1hYfmJQQcQe6Nx39Klx---21RSSVsjWEOxh6yN_0nJQM/edit?usp=sharing) de como instalar;
     
     3º - Instalar o [DBeaver](https://dbeaver.io/files/dbeaver-ce-latest-x86_64-setup.exe)
     
     4º - Após instalado, clique em criar nova conexão(vide imagem abaixo):
     ![img](https://i.imgur.com/guuX3aa.png)
     
     5º - Em seguida, siga o caminho abaixo para restaurar o script na tabela:
     ![img](https://i.imgur.com/yKpeZAh.png)
     
     6º - Clique no símbolo da pasta indicado, selecione o arquivo .sql baixado e clique em start:
     ![img](https://i.imgur.com/LDjKEgb.png)
     
     7º - Agora é só realizar as consultas, abrindo um novo script e digitando as linhas passadas mais acima !
     ![img](https://i.imgur.com/A30zgO8.png)
  
    
    
