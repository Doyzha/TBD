SELECT 
  st.name, 
  st.surname,
  h.name,
  CASE
    WHEN (sth.finished_at IS NULL) THEN 'Занимается'
    WHEN (sth.finished_at IS NOT NULL) THEN 'Закончил'
  END status
FROM student st, hobby h, student_hobby sth
WHERE sth.student_id = st.id AND sth.hobby_id = h.id
