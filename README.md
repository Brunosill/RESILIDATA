## Projeto-Resilia-3
# Banco de Dados - Resilia
- **Meu deus, eu não entendo nada de banco de dados, o que é isso que vocês fizeram ?**

   Calma lá que eu vou te explicar, nossa equipe fez a coleta de dados de vários setores diferentes da Resilia ( alunos, facilitadores, cursos, etc... )
   e colocamos tudo isso muito bonitinho dentro de tabelas, para facilitar a procura e gestão de dados dentro da empresa, agilizando assim processos que antes
   demandariam horas.

- **Tudo bem, já entendi, mas quem faz parte da sua equipe ?**

   Bem, a nossa equipe é composta por:
  
   - [Aline Ester ]()
   - [Ana Carolina](github.com/amoralles)
   - [Bruno Guedes](github.com/Brunosill)
   - [Laura Camargo]()
   -[Isabelle cavalcante](github.com/isa-sputnik)
  
   Somos todos estudantes da Resilia Educação, cursando Análise de Dados, possivelmente um dia seremos analistas de dados.
 
 - **Ok, vocês provavelmente fizeram um belo trabalho em equipe, dá pra mostrar como ficou o banco de dados ?**
 
   Sim, vamos  mostrar pra você, uma forma bem fácil de se visualizar dados, é com diagramas! Saca só o nosso:
   
   ![img](https://dbdiagram.io/d/62f4f39ec2d9cf52fa8c5cc2) 
   
   Nele você consegue verificar todas as chaves primárias e estrangeiras, e como elas se relacionam dentro do banco de dados.
   
 - **Nossa, ficou espetacular, aposto que vocês vão tirar a avaliação máxima nisso aí, e como vocês fazem as consultas nisso ?**
 
   Então, todo o banco foi implementado dentro de um programinha chamado PostgreSQL, é um programa que lê, executa e armazena
   scripts SQL, que nada mais são que linhas de código que fazem a inserção de informação dentro de uma base de dados.
   
   Por meio desses scripts, é possível tanto inserir novas informações, visualizar o que contém o nosso banco e fazer pesquisas
   absolutamente personalizáveis, a fim de trazer respostas claras e precisas.
   
   Alguns exemplos de perguntas feitas ao banco e seus scripts:
   
   **Selecionar a quantidade total de estudantes cadastrados no banco;**
   ```
   select count(*) from tb_aluno;
   ```

   **Selecionar todos os estudantes e seus respectivos cursos;**
   ```
   select cu.nome, al.nome, al.id_aluno from tb_aluno al
   INNER JOIN tb_turma tu
   ON al.id_turma = tu.id_turma
   INNER JOIN tb_curso cu
   ON cu.id_curso = tu.id_curso;
   ```
  
   **Selecionar quais facilitadores atuam em mais de uma turma;**
   ```
   select count(tf.id_facilitador) qntd, fa.nome  from tb_turma_facilitador tf
   INNER JOIN tb_facilitador fa
   ON tf.id_facilitador = fa.id_facilitador
   GROUP BY fa.id_facilitador
   HAVING count(tf.id_facilitador)>1;
   ```
   **Selecionar quantos alunos foram formados em WebDev;**
   ```
   select tt.id_curso, count(id_aluno) from tb_aluno ta
   inner join tb_turma tt ON ta.id_turma = tt.id_turma
   where tt.modulo = 0
   group by tt.id_curso
   having tt.id_curso = 1
   ;
   ```

   **Selecionar quantas turmas começaram no ano de 2021;**
   ```
   select count(id_turma) from tb_turma
   where data_inicio >= '01-01-2021';
   ```
  
   **Selecionar qual a turma com o maior número de facilitadores;**
   ```
   select tt.id_turma, count(id_facilitador) from tb_turma tt
   inner join tb_turma_facilitador ttf ON tt.id_turma = ttf.id_turma
   group by tt.id_turma
   order by count(id_facilitador) desc
   limit 1;
    ```