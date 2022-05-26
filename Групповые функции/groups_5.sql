SELECT 
  LEFT(st.n_group::VARCHAR,1) grade, 
  ROUND(AVG(st.score),2) score 
FROM student st 
GROUP BY 
  LEFT(st.n_group::VARCHAR,1)
