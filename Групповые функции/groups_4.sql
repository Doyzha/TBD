SELECT 
  EXTRACT(YEAR FROM st.birthday), 
  COUNT(EXTRACT(YEAR FROM st.birthday)) 
FROM student st 
GROUP BY 
  EXTRACT(YEAR FROM st.birthday)
