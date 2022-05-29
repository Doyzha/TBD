SELECT st.name, st.surname, st.n_group
FROM student st
WHERE
  st.id IN 
    (SELECT st.id
    FROM student st
    INNER JOIN student_hobby sth
    ON sth.student_id = st.id
    INNER JOIN hobby h
    ON sth.hobby_id = h.id
    GROUP BY st.id)
