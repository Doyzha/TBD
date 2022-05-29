SELECT st.id, st.name, st.surname, st.birthday
FROM student st,
  (SELECT st.id
  FROM student st
  INNER JOIN
    (SELECT *
      FROM student_hobby sth
      WHERE sth.finished_at IS NOT NULL) sth
  ON st.id = sth.student_id
  GROUP BY st.id
  HAVING COUNT(st.id) > 1) multhobby
WHERE 
  EXTRACT(DAYS FROM NOW() - st.birthday)/365 > 19 AND st.id = multhobby.id
