SELECT st.*
FROM student st
INNER JOIN student_hobby sth
ON st.id = sth.student_id
WHERE
  sth.hobby_id = (SELECT sth.hobby_id
    FROM student_hobby sth
    GROUP BY sth.hobby_id
    ORDER BY COUNT(sth.student_id) DESC
    LIMIT 1) AND
  sth.finished_at IS NULL
