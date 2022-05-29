SELECT EXTRACT(MONTH FROM st.birthday), COUNT(st.id)
FROM student st
INNER JOIN student_hobby sth
ON sth.student_id = st.id
INNER JOIN hobby h
ON sth.hobby_id = h.id
GROUP BY EXTRACT(MONTH FROM st.birthday), h.name
HAVING h.name = 'Футбол'
