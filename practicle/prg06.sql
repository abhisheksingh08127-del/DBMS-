CREATE OR REPLACE FUNCTION get_grade(
p_pct IN NUMBER
) RETURN VARCHAR2 IS
BEGIN
IF p_pct > 100 OR p_pct < 0 THEN
RETURN 'INVALID PERCENTAGE';
ELSIF p_pct >= 90 THEN
RETURN 'A+';
ELSIF p_pct >= 80 THEN
RETURN 'A';
ELSIF p_pct >= 70 THEN
RETURN 'B';
ELSIF p_pct >= 60 THEN
RETURN 'C';
ELSIF p_pct >= 50 THEN
RETURN 'D';
ELSE
RETURN 'F';
END IF;
END;
/

/*
-- Verification:
SELECT get_grade(94) AS g1, get_grade(73) AS g2, get_grade(42) AS g3 FROM dual;

*/
