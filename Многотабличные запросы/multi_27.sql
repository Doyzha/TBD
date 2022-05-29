SELECT LEFT(st.name::VARCHAR,1), MIN(st.score), MAX(st.score), ROUND(AVG(st.score),2)
FROM student st
GROUP BY LEFT(st.name::VARCHAR,1)
HAVING MAX(st.score) > 3.6
