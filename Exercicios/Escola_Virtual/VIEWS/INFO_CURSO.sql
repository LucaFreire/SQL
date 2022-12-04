CREATE VIEW INFO_CURSO AS
SELECT C.NOME FROM [CURSO] C
    JOIN [TURMA] T
        ON T.ID_CURSO = C.ID
    WHERE T.DATA_INICIO >= GETDATE() AND
        T.DATA_FIM < '01/06/2023';
