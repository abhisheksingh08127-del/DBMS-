SET SERVEROUTPUT ON;

DECLARE
    v_emp_id      employees.employee_id%TYPE := &enter_emp_id;
    v_age         employees.age%TYPE;
    c_min_age     CONSTANT NUMBER := 18;
    c_max_age     CONSTANT NUMBER := 60;
    e_invalid_age EXCEPTION;
BEGIN
    SELECT age
    INTO v_age
    FROM employees
    WHERE employee_id = v_emp_id;

    IF v_age < c_min_age OR v_age > c_max_age THEN
        RAISE e_invalid_age;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' age (' || v_age || ') is within valid range.');
EXCEPTION
    WHEN e_invalid_age THEN
        DBMS_OUTPUT.PUT_LINE('Violation: Employee age ' || v_age || 
                             ' is invalid. Permitted range is ' || c_min_age || ' - ' || c_max_age);
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ' || v_emp_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;
/