SET SERVEROUTPUT ON;

DECLARE
    v_emp_id        employees.employee_id%TYPE := &enter_emp_id;
    v_salary        employees.salary%TYPE;
    c_min_threshold CONSTANT NUMBER := 30000;
    e_low_salary    EXCEPTION;
BEGIN
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    IF v_salary < c_min_threshold THEN
        RAISE e_low_salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' has valid salary: ' || v_salary);
EXCEPTION
    WHEN e_low_salary THEN
        DBMS_OUTPUT.PUT_LINE('Violation: Salary ' || v_salary || ' is below minimum cap of ' || c_min_threshold);
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ' || v_emp_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;
/