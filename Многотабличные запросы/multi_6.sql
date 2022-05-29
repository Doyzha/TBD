SELECT st.n_group, ROUND(AVG(st.score))
FROM student st
INNER JOIN
  (SELECT *
    FROM student_hobby sth
    WHERE sth.finished_at IS NULL) curh
ON st.id = curh.student_id
GROUP BY st.n_group
