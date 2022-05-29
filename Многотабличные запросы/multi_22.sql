CREATE OR REPLACE VIEW h_mostpopular AS
SELECT DISTINCT ON (1) LEFT(st.n_group::VARCHAR,1) grade, h.id
FROM student st
INNER JOIN student_hobby sth
ON st.id = sth.student_id
INNER JOIN hobby h
ON sth.hobby_id = h.id
GROUP BY LEFT(st.n_group::VARCHAR,1), h.id
ORDER BY LEFT(st.n_group::VARCHAR,1), COUNT(h.id) DESC;

SELECT * FROM h_mostpopular
