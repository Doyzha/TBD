CREATE OR REPLACE VIEW h_mostrisk_2grade AS
SELECT *
FROM hobby h
WHERE h.id
IN
  (SELECT h.id
  FROM student st
  INNER JOIN student_hobby sth
  ON st.id = sth.student_id
  INNER JOIN hobby h
  ON sth.hobby_id = h.id
  WHERE LEFT(st.n_group::VARCHAR,1) = '2'
  GROUP BY h.id
  ORDER BY COUNT(h.id))
  FETCH FIRST 1 ROWS WITH TIES
ORDER BY h.risk DESC
LIMIT 1;

SELECT * FROM h_mostrisk_2grade
