SELECT h.name, h.risk, EXTRACT(MONTH FROM age(NOW(),sth.started_at))
FROM student st
INNER JOIN 
  (SELECT * FROM student_hobby sth
     WHERE sth.finished_at IS NULL) sth
ON st.id = sth.student_id
INNER JOIN hobby h
ON sth.hobby_id = h.id
WHERE st.id = 11
ORDER BY DATE_PART DESC
LIMIT 1
