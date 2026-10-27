CREATE OR REPLACE TRIGGER trg_set_emp_metadata
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    :NEW.created_date := SYSDATE;
    :NEW.created_by   := USER;
END;
/