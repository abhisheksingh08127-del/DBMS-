CREATE OR REPLACE FUNCTION get_greater_number(
p_num1 IN NUMBER,
p_num2 IN NUMBER
) RETURN NUMBER IS
BEGIN
IF p_num1 >= p_num2 THEN
RETURN p_num1;
ELSE
RETURN p_num2;
END IF;
END;
/

/*
-- Verification:
SELECT get_greater_number(450, 780) FROM dual;

*/
