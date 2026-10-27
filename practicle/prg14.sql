CREATE OR REPLACE PROCEDURE get_dept_headcount(
    p_dept_id    IN  employees.department_id%TYPE,
    p_emp_count  OUT NUMBER
)
IS
BEGIN
    SELECT COUNT(*)
    INTO p_emp_count
    FROM employees
    WHERE department_id = p_dept_id;
EXCEPTION
    WHEN OTHERS THEN
        p_emp_count := 0;
        RAISE;
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_total NUMBER;
    v_dept  NUMBER := 20;
BEGIN
    get_dept_headcount(p_dept_id => v_dept, p_emp_count => v_total);
    DBMS_OUTPUT.PUT_LINE('Total headcount for Department ' || v_dept || ': ' || v_total);
END;
/

/*
SELECT department_id, COUNT(*) AS total_employees 
FROM employees 
WHERE department_id = 20 
GROUP BY department_id;


*/