-- USE ESCOLA_VIRTUAL

-- UPDATES --
UPDATE TURMA
SET DATA_FIM = '2020'
WHERE ID = 2

UPDATE PROFESSOR
SET NOME = 'BRUNELAS'
WHERE NOME = 'GABU'


-- VIEWS --
SELECT * FROM INFO_ALUNOS
ORDER BY CURSO

SELECT * FROM INFO_CURSO

SELECT * FROM INFO_CIDADE

SELECT * FROM INFO_GASTO


-- PROCEDURES --
EXEC DATA_CURSO '10/10/2010'

EXEC CPF_BIT '12',1

DECLARE @VALOR_OUT FLOAT
EXEC CPF_GASTO '9', @VALOR = @VALOR_OUT OUTPUT 
SELECT @VALOR_OUT AS [VALOR GASTO]


-- TRIGGERS --
DELETE [PROFESSOR] 
WHERE NOME = 'BRUNELAS'
SELECT * FROM [PROFESSOR]

DELETE [ALUNO] 
WHERE NOME = 'MANU'
SELECT * FROM [ALUNO]


-- Crie uma tabela chamada HISTORICO_INSERCAO com as colunas: Id Função Data
CREATE TABLE HISTORICO_INSERCAO
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PROFESSOR_ID_HISTORICO INT,
    ALUNO_ID_HISTORICO INT,
    DATA_TABELA DATE DEFAULT GETDATE(),
    FUNCAO VARCHAR(12)
)


INSERT INTO ALUNO(NOME, CPF, CIDADE, DT_NASCIMENTO) 
VALUES
    ('EDSON', '22','Curitiba', '10/10/2010')

INSERT INTO PROFESSOR(NOME, CPF, CIDADE) 
VALUES
    ('LIRA', '44','Curitiba')


SELECT * FROM HISTORICO_INSERCAO