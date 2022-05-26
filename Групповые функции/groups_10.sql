SELECT st.*
FROM 
  (SELECT st.n_group, MAX(st.score) FROM student st GROUP BY st.n_group) gr_max,
  student st
WHERE
  gr_max.n_group = st.n_group AND gr_max.max = st.score
