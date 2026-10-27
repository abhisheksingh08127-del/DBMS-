CREATE OR REPLACE FUNCTION get_emp_bonus(
    p_salary IN NUMBER
) RETURN NUMBER
IS
BEGIN
    IF p_salary IS NULL OR p_salary <= 0 THEN
        RETURN 0;
    ELSIF p_salary >= 50000 THEN
        RETURN p_salary * 0.15;
    ELSE
        RETURN p_salary * 0.10;
    END IF;
END;
/