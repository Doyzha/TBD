SELECT TRIM(TRAILING '#' FROM OVERLAY('##########' placing st.surname FROM 1))
FROM student st
