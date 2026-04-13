use empresa;
CREATE TABLE tb_departamentos (
    id_departamento INT PRIMARY KEY identity,
    nome varchar (100) NOT NULL
);

CREATE TABLE tb_empregados (
    id_empregado INT PRIMARY KEY identity,
    nome VARCHAR (100) NOT NULL,
    sexo INT,
    salario DECIMAL (11,2),
    data_nascimento DATE,
    departamento_id INT
);

CREATE TABLE tb_projetos (
    id_projeto INT PRIMARY KEY identity,
    nome varchar (30) NOT NULL
);

CREATE TABLE tb_projeto_empregados (
    id_projeto_empregado INT PRIMARY KEY identity,
    empregado_id INT,
    projeto_id INT,
    data_inicial DATE,
    data_final DATE
);


/* =====================================
 Criando as CHAVES ESTRANGEIRAS (FKs)*/

ALTER TABLE tb_empregados
ADD CONSTRAINT FK_Empregado_Departamento
FOREIGN KEY (departamento_id)
REFERENCES tb_departamentos(id_departamento);

ALTER TABLE tb_projeto_empregados
ADD CONSTRAINT FK_Projeto_Empregado
FOREIGN KEY (empregado_id)
REFERENCES tb_empregados(id_empregado);

ALTER TABLE tb_projeto_empregados
ADD CONSTRAINT FK_Projeto_Projeto
FOREIGN KEY (projeto_id)
REFERENCES tb_projetos(id_projeto);


/* =====================================
# INSERINDO DADOS NAS TABELAS*/

INSERT INTO tb_departamentos
    (nome)
VALUES
    ('Tecnologia'),
    ('Financeiro'),
    ('Contabilidade'),
    ('Vendas'),
    ('Recursos Humanos'),
    ('Produção');


INSERT INTO tb_empregados
    (nome, sexo, salario, data_nascimento, departamento_id)
VALUES
    ('João da Silva', 1, 1000, '2000-03-07', 1),
    ('Maria Silveira', 2, 1000,'2003-04-13', 1),
    ('Lidia Pereira', 2, 1200, '2000-05-20', 1),
    ('Victor Oliveira', 1, 1500, '1991-06-29', 1),
    ('Paulo Silva Campos', 1, 5000, '1992-05-31', 2),
    ('Pedro Campos', 1, 10000, '2001-02-10', 2),
    ('José da Silva Oliveira', 1, 9500, '2000-02-28', 2),
    ('João Carlos Pereira', 1, 15000, '1999-03-30', 2),
    ('Ana Paula Amorim', 2, 20000, '1998-07-19', 3),
    ('Antônia de Castro', 2, 2000, '1965-10-22', 3),
    ('Elisa Silveira Campos', 2, 3000, '1980-12-16', 3),
    ('Gilson Machado', 1, 1000, '1982-11-13',3),
    ('Andreia Vitoria Silva', 2, 1200, '1990-11-17',4),
    ('Vicente da Rosa Silva', 1, 2200, '1995-10-08',4),
    ('Juliana Oliveira', 2, 3500, '1997-08-05',4),
    ('Marlon da Silva', 1, 2400,'1996-09-03',null),
    ('Silvio Luis Oliveira', 1, 1800, '2006-09-01',5),
    ('Roberto Carlos Castro', null, 4300, '2002-02-11',5),
    ('Maria Betânia Amorim', null, 5500, '1999-03-2',5),
    ('Rita de Castro Campos', null, 3800, '1975-01-7',null);


INSERT INTO tb_projetos
    (nome)
VALUES
    ('Alfa'),
    ('Beta'),
    ('Gama'),
    ('Delta'),
    ('Omega'),
    ('Lambda'),
    ('Churras');


INSERT INTO tb_projeto_empregados
    (empregado_id, projeto_id, data_inicial, data_final)
VALUES
    (1, 1, '2022-01-01', '2022-01-31'),
    (2, 1, '2022-01-10', '2022-02-28'),
    (3, 1, '2022-03-01', '2022-03-31'),
    (4, 2, '2022-04-01', '2022-04-30'),
    (5, 2, '2022-05-01', '2022-05-31'),
    (6, 2, '2022-06-01', '2022-06-30'),
    (7, 3, '2022-07-01', '2022-07-31'),
    (8, 3, '2022-08-01', '2022-08-31'),
    (9, 3, '2022-09-01', '2022-09-30'),
    (10, 4, '2022-10-01', '2022-10-31'),
    (11, 4, '2022-11-01', '2022-11-30'),
    (12, 4, '2022-12-01', '2022-12-31'),
    (13, 5, '2021-01-01', '2021-01-31'),
    (14, 5, '2021-02-01', '2021-02-28'),
    (15, 5, '2021-03-01', '2021-03-31');


	SELECT  CONCAT ('funcionários_', nome) AS empregados, CONCAT ('departamento_', nome) AS departamentos 
	FROM tb_empregados
	
	SELECT UPPER (nome) FROM tb_departamentos


	SELECT LEFT(nome,3) FROM tb_empregados;

	SELECT LEN (nome) FROM tb_projetos;

	SELECT REPLACE (nome, 'A', 4) FROM tb_empregados;

	SELECT AVG (salario) FROM tb_empregados;

	SELECT SUM(salario) FROM tb_empregados
	WHERE sexo = 2;

	SELECT SUM(salario) FROM tb_empregados
	WHERE sexo = 1;

	SELECT  MAX (salario)
	FROM tb_empregados
	

	SELECT DATEDIFF ("DAY", data_inicial, data_final ) AS total_dias
	FROM tb_projeto_empregados

	SELECT *
	FROM tb_empregados
	WHERE salario = (SELECT MAX(salario) FROM tb_empregados);

	SELECT *
	FROM tb_empregados
	WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) > 15;
	
	



	
