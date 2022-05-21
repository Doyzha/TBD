SELECT 
  st.name, st.surname, h.name 
FROM student st, student_hobby sth, hobby h 
WHERE 
  st.id = sth.student_id AND 
  sth.hobby_id = h.id AND 
  sth.finished_at IS NULL
