
SET SERVEROUTPUT ON;
DECLARE
        v_emp_id   employees.employee_id%TYPE := &enter_emp_id;
  v_emp_name employees.first_name%TYPE;
   BEGIN
       SELECT first_name
        INTO v_emp_name
        FROM employees
        WHERE employee_id = v_emp_id;
    
       DBMS_OUTPUT.PUT_LINE('Employee found: ' || v_emp_name);
   EXCEPTION
       WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('Result: Employee with ID ' || v_emp_id || ' does not exist.');
      WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
   END;
  /
  
  /*
  DROP TABLE employees CASCADE CONSTRAINTS;
CREATE TABLE employees (
  employee_id   NUMBER PRIMARY KEY,
  first_name    VARCHAR2(50) NOT NULL,
  last_name     VARCHAR2(50), 
  age           NUMBER,
  salary        NUMBER(10, 2),
  department_id NUMBER,
  created_date  DATE,
  created_by    VARCHAR2(50)
);
CLEAN CODE COPY EDITION
INSERT INTO employees VALUES (101, 'John', 'Doe', 28, 25000, 10, NULL, NULL);
INSERT INTO employees VALUES (102, 'Jane', 'Smith', 35, 45000, 20, NULL, NULL);
INSERT INTO employees VALUES (103, 'Alex', 'Brown', 42, 60000, 20, NULL, NULL);
COMMIT;
  
  
  */
