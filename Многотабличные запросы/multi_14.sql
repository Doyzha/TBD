CREATE OR REPLACE VIEW st_hobby_morethanyear AS
SELECT st.*
FROM student st
INNER JOIN student_hobby sth
ON sth.student_id = st.id
WHERE
  sth.finished_at IS NULL AND
  EXTRACT(YEAR FROM AGE(NOW(),sth.started_at)) > 1;
 
 SELECT * FROM st_hobby_morethanyear
