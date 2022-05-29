SELECT st.id, st.name, st.surname, st.address, h.name, sth.time_h FROM student st 
INNER JOIN 
  (SELECT 
    sth.student_id, 
    sth.hobby_id,
    sth.finished_at - sth.started_at time_h 
  FROM student_hobby sth 
  WHERE sth.finished_at - sth.started_at IS NOT NULL) sth 
ON st.id = sth.student_id
INNER JOIN hobby h
ON sth.hobby_id = h.id
