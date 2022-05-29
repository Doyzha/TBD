SELECT 
  st.id, 
  st.name, 
  st.surname, 
  st.birthday, 
  LEFT(st.n_group::VARCHAR,1) grade
FROM student st
WHERE 
  st.score >= 4.5 AND
  st.id IN
    (SELECT sth.student_id
    FROM student_hobby sth
    GROUP BY sth.student_id
    HAVING COUNT(sth.finished_at) = COUNT(sth.started_at))
ORDER BY
  LEFT(st.n_group::VARCHAR,1),
  st.birthday DESC
