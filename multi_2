SELECT * FROM student st 
INNER JOIN 
  (SELECT 
    sth.student_id, 
    sth.finished_at - sth.started_at time_h 
  FROM student_hobby sth 
  WHERE sth.finished_at - sth.started_at IS NOT NULL) sth 
ON st.id = sth.student_id 
ORDER BY time_h DESC 
LIMIT 1
