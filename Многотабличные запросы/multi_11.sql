SELECT sub.n_group
FROM
  (SELECT 
    st.n_group, 
    COUNT(st.id) total_count, 
    COUNT(st.score) FILTER (WHERE st.score > 4) above_score_count
  FROM student st
  GROUP BY st.n_group) sub
WHERE sub.total_count*0.6 < above_score_count
