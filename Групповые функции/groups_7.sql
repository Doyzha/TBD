SELECT st.n_group, ROUND(AVG(st.score),2) score
FROM student st
GROUP BY
  st.n_group
HAVING
  AVG(st.score) <= 3.5
ORDER BY 
  AVG(st.score)
