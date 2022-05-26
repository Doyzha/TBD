SELECT st.n_group
FROM student st
WHERE
  LEFT(st.n_group::VARCHAR,1) = '2'
GROUP BY
  st.n_group
ORDER BY 
  AVG(st.score) DESC
LIMIT 1
