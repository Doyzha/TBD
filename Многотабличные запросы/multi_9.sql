SELECT h.name FROM student st
INNER JOIN student_hobby sth
ON sth.student_id = st.id
INNER JOIN hobby h
ON sth.hobby_id = h.id
WHERE 
  LEFT(st.n_group::VARCHAR, 1) = '2' AND st.score >= 2.5 AND st.score < 3.5 AND sth.finished_at IS NULL
