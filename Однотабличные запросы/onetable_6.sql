SELECT st_h.id, st_h.hobby_id FROM student_hobby st_h WHERE st_h.started_at > '2009-01-01' AND st_h.started_at < '2022-01-01' AND st_h.finished_at IS NULL
