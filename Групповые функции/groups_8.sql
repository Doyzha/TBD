SELECT 
  st.n_group,
  COUNT(st.id) student_count,
  MAX(st.score),
  ROUND(AVG(st.score),2),
  MIN(st.score)
FROM student st
GROUP BY
  st.n_group
