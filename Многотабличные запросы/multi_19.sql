SELECT *, AGE(COALESCE(finished_at,NOW()),started_at) do_time
FROM student st
INNER JOIN student_hobby sth
ON st.id = sth.student_id
ORDER BY do_time DESC
LIMIT 10
