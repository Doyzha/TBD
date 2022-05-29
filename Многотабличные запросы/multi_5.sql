SELECT
	st.name, 
	st.surname, 
	st.id, 
	st.birthday, 
	h.name, 
	sth.finished_at,
	(DATE_PART('year', CAST(CURRENT_DATE AS date)) - DATE_PART('year', st.birthday)) AS age
FROM 
	student st, 
	student_hobby sth, 
	hobby h,
	(SELECT st.id
	FROM student st, 
	student_hobby sth, 
	hobby h
	WHERE st.id = sth.student_id 
	 AND sth.hobby_id = h.id 
	 AND sth.finished_at IS NULL
	GROUP BY st.id) AS hobby_sum
WHERE 
	st.id = sth.student_id 
	AND sth.hobby_id = h.id
	AND (DATE_PART('year', CAST(CURRENT_DATE AS date)) - DATE_PART('year', st.birthday)) >= 19
	AND sth.finished_at IS NULL
	AND hobby_sum.id = st.id
GROUP BY 
	st.name, 
	st.surname, 
	st.id, 
	st.birthday, 
	h.name, 
	sth.finished_at
