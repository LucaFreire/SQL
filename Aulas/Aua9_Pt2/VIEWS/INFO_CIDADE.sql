ALTER VIEW INFO_CIDADE AS
SELECT DISTINCT CIDADE
FROM ALUNO
UNION
SELECT DISTINCT CIDADE
FROM PROFESSOR