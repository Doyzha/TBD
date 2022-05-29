CREATE OR REPLACE FUNCTION risk_by_letters()
RETURNS TABLE (
  letter VARCHAR, 
  maxrisk NUMERIC(4,2), 
  minrisk NUMERIC(4,2)) 
AS
$$
DECLARE 
  ch TEXT;
  tmp RECORD;
BEGIN
  FOREACH ch IN ARRAY regexp_split_to_array('абвгдеёжзийклмнопрстуфхцчшщъыьэюя', '')
  LOOP
    SELECT 
      ch, 
      MAX(h.risk) maxr, 
      MIN(h.risk) minr 
    INTO tmp
    FROM student st
    INNER JOIN student_hobby sth
    ON sth.student_id = st.id
    INNER JOIN hobby h
    ON sth.hobby_id = h.id
    GROUP BY
      st.name ILIKE ('%' || ch || '%')
    HAVING
      st.name ILIKE ('%' || ch || '%');

    IF tmp.ch IS NOT NULL 
    THEN
      letter = tmp.ch;
      maxrisk = tmp.maxr;
      minrisk = tmp.minr;
      RETURN NEXT;
    END IF;
  END LOOP;
END
$$ LANGUAGE plpgsql;

SELECT * FROM risk_by_letters()
