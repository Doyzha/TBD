SELECT EXTRACT(YEAR FROM st.birthday), COUNT(*)
FROM student st
INNER JOIN student_hobby sth
ON st.id = sth.student_id
GROUP BY EXTRACT(YEAR FROM st.birthday)
