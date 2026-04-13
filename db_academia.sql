USE db_academia;
GO

CREATE TABLE dbo.tb_logradouro(
id_logradouro INT IDENTITY(1,1) PRIMARY KEY,
cep CHAR(8)NOT NULL UNIQUE,
pais NVARCHAR(45) NOT NULL,
uf CHAR(2) NOT NULL,
cidade NVARCHAR(45) NOT NULL,
bairro NVARCHAR(45) NOT NULL,
logradouro NVARCHAR(45) NOT NULL
);

GO

CREATE TABLE dbo.tb_aluno (
id_aluno INT IDENTITY(1,1) PRIMARY KEY,
cpf CHAR(11) NOT NULL UNIQUE,
telefone CHAR(11) NOT NULL,
nome NVARCHAR(45) NOT NULL,
nascimento DATE NOT NULL,
email NVARCHAR(45) NULL,
logradouro_id INT NOT NULL,
numero NVARCHAR(10) NOT NULL,
complemento NVARCHAR(45) NULL,
senha NVARCHAR(255) NULL,
FOREIGN KEY (logradouro_id) REFERENCES dbo.tb_logradouro(id_logradouro)
);
GO
CREATE TABLE dbo.tb_colaborador (
id_colaborador INT IDENTITY(1,1) PRIMARY KEY,
cpf CHAR(11) NOT NULL UNIQUE,
telefone CHAR(11) NOT NULL,
nome NVARCHAR(45) NOT NULL,
nascimento DATE NOT NULL,
email NVARCHAR(45) NULL,
logradouro_id INT NOT NULL,
numero NVARCHAR(10) NOT NULL,
complemento NVARCHAR(45) NULL,
senha NVARCHAR(255) NULL,
admissao DATE NOT NULL,
tipo CHAR(1) NOT NULL,
vinculo CHAR(1) NOT NULL,
FOREIGN KEY (logradouro_id) REFERENCES dbo.tb_logradouro(id_logradouro)
);
GO

CREATE TABLE dbo.tb_matricula (
id_matricula INT IDENTITY(1,1) PRIMARY KEY,
aluno_id INT NOT NULL,
colaborador_id INT NOT NULL,
plano CHAR(1) NULL,
data_inicio DATE NULL,
data_fim DATE NULL,
objetivo NVARCHAR(100) NULL,
restricao_medica NVARCHAR(255) NULL,
obs_restricao NVARCHAR(255) NULL,
laudo_medico VARBINARY(MAX) NULL,
FOREIGN KEY (aluno_id) REFERENCES dbo.tb_aluno(id_aluno),
FOREIGN KEY (colaborador_id) REFERENCES dbo.tb_colaborador(id_colaborador)
);
GO
CREATE TABLE dbo.tb_frequencia (
id_frequencia INT IDENTITY(1,1) PRIMARY KEY,
aluno_id INT NOT NULL,
entrada DATETIME NOT NULL,
saida DATETIME NULL,
FOREIGN KEY (aluno_id) REFERENCES dbo.tb_aluno(id_aluno)
);
GO

CREATE TABLE dbo.tb_avaliacao (
id_avaliacao INT IDENTITY(1,1) PRIMARY KEY,
aluno_id INT NOT NULL,
colaborador_id INT NOT NULL,
data DATETIME NULL,
peso DECIMAL(18, 2) NULL,
altura DECIMAL(18, 2) NULL,
torax DECIMAL(18, 2) NULL,
cintura DECIMAL(18, 2) NULL,
quadril DECIMAL(18, 2) NULL,
antebraco_direito DECIMAL(18, 2) NULL,
antebraco_esquerdo DECIMAL(18, 2) NULL,
biceps_direito DECIMAL(18, 2) NULL,
biceps_esquerdo DECIMAL(18, 2) NULL,
coxa_direita DECIMAL(18, 2) NULL,
coxa_esquerda DECIMAL(18, 2) NULL,
panturrilha_direita DECIMAL(18, 2) NULL,
panturrilha_esquerda DECIMAL(18, 2) NULL,
massa_gorda DECIMAL(18, 2) NULL,
massa_magra DECIMAL(18, 2) NULL,
percentual_gordura DECIMAL(18, 2) NULL,
imc DECIMAL(18, 2) NULL,
peso_ideal DECIMAL(18, 2) NULL,
observacoes NVARCHAR(45) NULL,
FOREIGN KEY (aluno_id) REFERENCES dbo.tb_aluno(id_aluno),
FOREIGN KEY (colaborador_id) REFERENCES dbo.tb_colaborador(id_colaborador)
);
GO
-- Tables tb_treino and tb_aula are empty, so they're created without columns.
CREATE TABLE dbo.tb_treino (
id_treino INT IDENTITY(1,1) PRIMARY KEY
);
GO
CREATE TABLE dbo.tb_aula (
id_aula INT IDENTITY(1,1) PRIMARY KEY
);
GO

INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500001', 'Brasil', 'SC', 'Lages', 'bairro 1', 'rua 1 lages');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500002', 'Brasil', 'SC', 'Lages', 'bairro 2', 'rua 2 lages');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500003', 'Brasil', 'SC', 'Lages', 'bairro 3', 'rua 3 lages');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500004', 'Brasil', 'SC', 'Floripa', 'bairro 4', 'rua 4 floripa');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500005', 'Brasil', 'SC', 'Floripa', 'bairro 5', 'rua 5 floripa');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500006', 'Brasil', 'PR', 'Curitiba', 'bairro 6', 'rua 5 curitiba');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500007', 'Brasil', 'RS', 'Vacaria', 'bairro 7', 'rua 7 vacaria');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500008', 'Brasil', 'RS', 'Vacaria', 'bairro 8', 'rua 8 vacaria');
INSERT INTO tb_logradouro (cep, pais, uf, cidade, bairro, logradouro) VALUES ('88500009', 'Brasil', 'SC', 'Rio do Sul', 'bairro 9', 'rua 9 rio do sul');