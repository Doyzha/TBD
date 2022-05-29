CREATE OR REPLACE VIEW students_short AS
SELECT st.id, st.name, st.surname, st.n_group
FROM student st;
	
SELECT * FROM students_short
