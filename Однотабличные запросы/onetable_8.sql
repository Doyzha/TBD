SELECT * FROM student st WHERE st.score >= 4.5 ORDER BY st.score DESC LIMIT 2

SELECT * FROM student st WHERE st.score >= 4.5 ORDER BY st.score DESC FETCH FIRST 2 ROWS ONLY
