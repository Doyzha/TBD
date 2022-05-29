SELECT h.name, COUNT(DISTINCT sth.student_id)
FROM hobby h
INNER JOIN student_hobby sth
ON h.id = sth.hobby_id
GROUP BY h.name
