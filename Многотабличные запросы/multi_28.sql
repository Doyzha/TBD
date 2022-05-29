SELECT 
  LEFT(st.n_group::VARCHAR,1), 
  st.surname,
  MIN(st.score),
  MAX(st.score)
FROM student st
GROUP BY
  LEFT(st.n_group::VARCHAR,1),
  st.surname
