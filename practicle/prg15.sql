CREATE OR REPLACE PROCEDURE give_salary_raise(
    p_emp_id       IN employees.employee_id%TYPE,
    p_percent_hike IN NUMBER
)
IS
    v_current_salary employees.salary%TYPE;
    v_new_salary     employees.salary%TYPE;
    c_salary_ceiling CONSTANT NUMBER := 200000;
BEGIN
    SELECT salary
    INTO v_current_salary
    FROM employees
    WHERE employee_id = p_emp_id
    FOR UPDATE;

    v_new_salary := v_current_salary * (1 + (p_percent_hike / 100));

    IF v_new_salary > c_salary_ceiling THEN
        RAISE_APPLICATION_ERROR(
            -20002, 
            'Salary exceeds corporate limit of ' || c_salary_ceiling
        );
    END IF;

    UPDATE employees
    SET salary = v_new_salary
    WHERE employee_id = p_emp_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Success: Employee ' || p_emp_id || ' salary raised to ' || v_new_salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || p_emp_id || ' does not exist.');
        ROLLBACK;
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/


SET SERVEROUTPUT ON;
EXEC give_salary_raise(103, 10);

/*
SELECT employee_id, first_name, salary 
FROM employees 
WHERE employee_id = 103;


*/