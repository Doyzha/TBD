CREATE OR REPLACE VIEW h_popular AS
SELECT *
FROM hobby h
WHERE 
  h.id = 
    (SELECT h.id
    FROM student st
    INNER JOIN student_hobby sth
    ON st.id = sth.student_id
    INNER JOIN hobby h
    ON sth.hobby_id = h.id
    GROUP BY h.id
    ORDER BY COUNT(h.id) DESC
    LIMIT 1);
	
SELECT * FROM h_popular
