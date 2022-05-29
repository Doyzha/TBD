SELECT LEFT(st.n_group::VARCHAR,1) grade, COUNT(DISTINCT h.id)
FROM student st
INNER JOIN student_hobby sth
ON sth.student_id = st.id
INNER JOIN hobby h
ON sth.hobby_id = h.id
GROUP BY LEFT(st.n_group::VARCHAR,1)
