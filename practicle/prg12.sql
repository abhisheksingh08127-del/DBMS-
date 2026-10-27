CREATE OR REPLACE TRIGGER trg_prevent_dept_deletion
BEFORE DELETE ON employees
FOR EACH ROW
DECLARE
    c_protected_dept CONSTANT NUMBER := 10;
BEGIN
    IF :OLD.department_id = c_protected_dept THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Operation Prohibited: Employees in Department ' || c_protected_dept || ' cannot be deleted.'
        );
    END IF;
END;
/


/*
DELETE FROM employees WHERE employee_id = 101;

SELECT employee_id, first_name, department_id 
FROM employees 
WHERE employee_id = 101;


*/
