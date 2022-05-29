SELECT sth.hobby_id
FROM student_hobby sth
GROUP BY sth.hobby_id
ORDER BY COUNT(sth.student_id) DESC
LIMIT 1
