CREATE OR REPLACE FUNCTION get_annual_salary(
p_monthly_salary IN NUMBER
) RETURN NUMBER IS
BEGIN
RETURN NVL(p_monthly_salary, 0) * 12;
END;
/

/*
-- Verification:
SELECT first_name, salary, get_annual_salary(salary) AS annual FROM employees;

*/