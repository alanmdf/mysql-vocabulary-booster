SELECT 
    CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS `Nome completo`,
    CONCAT(IF(DAY(JH.START_DATE) < 10,
                CONCAT(0, DAY(JH.START_DATE)),
                DAY(JH.START_DATE)),
            '/',
            IF(MONTH(JH.START_DATE) < 10,
                CONCAT(0, MONTH(JH.START_DATE)),
                MONTH(JH.START_DATE)),
            '/',
            YEAR(JH.START_DATE)) AS `Data de início`,
    CONCAT(IF(DAY(JH.END_DATE) < 10,
                CONCAT(0, DAY(JH.END_DATE)),
                DAY(JH.END_DATE)),
            '/',
            IF(MONTH(JH.END_DATE) < 10,
                CONCAT(0, MONTH(JH.END_DATE)),
                MONTH(JH.END_DATE)),
            '/',
            YEAR(JH.END_DATE)) AS `Data de rescisão`,
    ROUND((DATEDIFF(END_DATE, START_DATE) / 365),
            2) AS `Anos trabalhados`
FROM
    hr.employees AS E
        INNER JOIN
    hr.job_history AS JH ON JH.EMPLOYEE_ID = E.EMPLOYEE_ID
ORDER BY `Nome completo` , `Anos trabalhados`;
