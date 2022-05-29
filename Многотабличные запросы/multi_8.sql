SELECT h.* FROM student st
INNER JOIN student_hobby sth
ON sth.student_id = st.id
INNER JOIN hobby h
ON sth.hobby_id = h.id
WHERE 
  st.score = (SELECT st.score
  FROM student st
  GROUP BY st.score
  ORDER BY st.score DESC
  LIMIT 1)
