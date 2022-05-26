SELECT st.*
FROM 
  (SELECT * FROM 
    (SELECT st.n_group, MAX(st.score) FROM student st GROUP BY st.n_group) gr_max
  WHERE gr_max.n_group = '2255') temp_res,
  student st
WHERE
  temp_res.n_group = st.n_group AND temp_res.max = st.score
