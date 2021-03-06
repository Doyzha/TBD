SELECT st.id, st.name, st.surname, st.birthday
FROM 
  student st,
  (SELECT sth.student_id, SUM(h.risk)
    FROM hobby h
    INNER JOIN student_hobby sth
    ON h.id = sth.hobby_id
    GROUP BY sth.student_id
    HAVING SUM(h.risk) > 9) hrisk
WHERE 
  st.score > (SELECT ROUND(AVG(st.score)) FROM student st) AND hrisk.student_id = st.id
