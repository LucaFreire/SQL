-- Crie uma view que faça um select mostrando o nome dos alunos
-- que gastaram mais de 1.000,00 no ano atual

CREATE OR ALTER VIEW INFO_GASTO AS
SELECT
    A.NOME ALUNO
FROM ALUNO A
JOIN [ALUNO_TURMA] TA
    ON A.ID = TA.ID_TURMA
JOIN [TURMA] T
    ON TA.ID_TURMA = T.ID
JOIN [CURSO] C
    ON T.ID_CURSO = C.ID
GROUP BY A.NOME
    HAVING SUM(C.VALOR) >= 1000
