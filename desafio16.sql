USE hr;
DELIMITER $$

CREATE FUNCTION buscar_quantidade_de_empregos_por_funcionario(email VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE total_empregos INT;
    SELECT COUNT(*) FROM hr.job_history AS JH
    INNER JOIN hr.employees AS E ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
    WHERE E.EMAIL = email
    INTO total_empregos;
    RETURN total_empregos;
END $$

DELIMITER ;
