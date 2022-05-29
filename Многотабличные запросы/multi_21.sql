CREATE OR REPLACE VIEW st_orderby_score AS
SELECT st.id, st.name, st.surname
FROM student st
ORDER BY st.score DESC;

SELECT * FROM st_orderby_score
