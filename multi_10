SELECT *
FROM
  (SELECT LEFT(st.n_group::VARCHAR,1), COUNT(st.id) 
    FROM student st
    GROUP BY
      LEFT(st.n_group::VARCHAR,1)) total
INNER JOIN
  (SELECT LEFT(st.n_group::VARCHAR,1), COUNT(st.id)
    FROM
      student st,
      (SELECT st.id, COUNT(st.id) FROM student st
        INNER JOIN student_hobby sth
        ON sth.student_id = st.id
        INNER JOIN hobby h
        ON sth.hobby_id = h.id
        WHERE sth.finished_at IS NULL
        GROUP BY st.id
        HAVING COUNT(st.id) > 1) morethanone
    WHERE
      st.id = morethanone.id
    GROUP BY
      LEFT(st.n_group::VARCHAR,1)) morethanone
ON total.left = morethanone.left
WHERE
  total.count / 2 < morethanone.count
