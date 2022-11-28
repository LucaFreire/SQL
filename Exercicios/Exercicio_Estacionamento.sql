USE MASTER

CREATE DATABASE ESTACIONAMENTO

USE ESTACIONAMENTO


CREATE TABLE CLIENTE(
    CPF VARCHAR(12) PRIMARY KEY,
    NOME VARCHAR(30),
    DT_NASC DATE
);

CREATE TABLE MODELO(
    ID INT IDENTITY (1,1) PRIMARY KEY,
    NOME VARCHAR(40)
);

CREATE TABLE PATIO(
    ID INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
    ENDERECO VARCHAR(40),
    CAPACIDADE INT
);

CREATE TABLE VEICULO(
    ID VARCHAR(9) PRIMARY KEY,
    MODELO_COD INT FOREIGN KEY REFERENCES MODELO(ID),
    CLIENTE_CPF VARCHAR(12) FOREIGN KEY REFERENCES CLIENTE(CPF),
    COR VARCHAR(20)
);

CREATE TABLE ESTACIONA(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PATIO_ID INT FOREIGN KEY REFERENCES PATIO(ID),
    VEICULO_ID VARCHAR(9) NOT NULL FOREIGN KEY REFERENCES VEICULO(ID),
    DT_ENTRADA DATE NOT NULL DEFAULT GETDATE(),
    DT_SAIDA DATE,
    HORAS_ENTRADA TIME NOT NULL DEFAULT GETDATE(),
);


INSERT INTO CLIENTE(CPF, NOME, DT_NASC)
VALUES
    ('12345678912','Zézin','08/11/2004'),
    ('12345678913','Pedro','12/11/2004'),
    ('12345678914','Lucas','02/11/2005'),
    ('12345678915','JÃO','10/11/2002')

INSERT INTO MODELO(NOME)
VALUES
    ('2004'),
    ('2005'),
    ('2006'),
    ('2007')

INSERT INTO PATIO(ENDERECO, CAPACIDADE)
VALUES
    ('RUA1',5),
    ('RUA2',6),
    ('RUA3',7),
    ('RUA4',8)

INSERT INTO VEICULO(ID,COR,MODELO_COD,CLIENTE_CPF)
VALUES
    ('PLACA1','AZUL',1,'12345678912'),
    ('PLACA2','PRETO',2,'12345678913'),
    ('PLACA3','BRANCO',3,'12345678914'),
    ('PLACA4','VERMELHO',4,'12345678915')

INSERT INTO ESTACIONA(DT_SAIDA,VEICULO_ID, PATIO_ID)
VALUES
    ('10/12/2033','PLACA1',1),
    ('12/02/2034','PLACA2',2),
    ('11/02/2024','PLACA3',3),
    ('11/02/2044','PLACA4',4)


UPDATE CLIENTE SET NOME ='Thigas' WHERE CPF = '12345678912' -- Cpf's nome p/ Thigas

----- LETRAS -----

-- a) Exiba a placa e o nome dos donos de todos os veículos.
SELECT V.ID AS PLACAS, C.NOME
FROM CLIENTE AS C JOIN VEICULO AS V ON C.CPF = V.CLIENTE_CPF 

-- Inserindo valores p/ fazer a b
INSERT INTO CLIENTE(CPF, NOME, DT_NASC) VALUES ('12345688912','Dedélas','08/11/2004')
INSERT INTO MODELO(NOME) VALUES ('2008')
INSERT INTO PATIO(ENDERECO, CAPACIDADE) VALUES ('RUA1',5)
INSERT INTO VEICULO(ID,COR,MODELO_COD,CLIENTE_CPF) VALUES ('JJJ-2020','ROXO',5,'12345688912')
INSERT INTO ESTACIONA(DT_SAIDA,VEICULO_ID, PATIO_ID) VALUES ('11/11/2030','JJJ-2020',5)

--b) Exiba o CPF e o nome do cliente que possui o veiculo de placa “JJJ-2020”
SELECT C.CPF AS CPF, C.NOME, V.ID AS PLACA
FROM VEICULO AS V JOIN CLIENTE AS C ON C.CPF= V.CLIENTE_CPF WHERE V.ID ='JJJ-2020' 
