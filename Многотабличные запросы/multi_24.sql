CREATE OR REPLACE VIEW st_idealscore_bygrade AS
SELECT 
  LEFT(st.n_group::VARCHAR,1) grade, 
  COUNT(st.id) total, 
  COUNT(st.id) FILTER (WHERE st.score >= 4.5) goodcount
FROM student st
GROUP BY LEFT(st.n_group::VARCHAR,1);

SELECT * FROM st_idealscore_bygrade
