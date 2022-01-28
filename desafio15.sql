USE hr;
DELIMITER $$

CREATE PROCEDURE buscar_media_por_cargo(IN nome_do_cargo VARCHAR(100)) 
BEGIN
SELECT ROUND(AVG(E.SALARY), 2) AS `Média salarial` FROM hr.employees AS E
    INNER JOIN hr.jobs AS J ON J.JOB_ID = E.JOB_ID
    WHERE J.JOB_TITLE = nome_do_cargo;
END $$

DELIMITER ;
