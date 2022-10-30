1. Выведите на экран любое сообщение

DO
$$
BEGIN
    RAISE NOTICE 'Hello World!';
END
$$

2. Выведите на экран текущую дату

DO
$$
BEGIN
    RAISE NOTICE 'Текущая дата: %', CURRENT_DATE;
END
$$

3. Создайте две числовые переменные и присвойте им значение. Выполните математические действия с этими числами и выведите результат на экран.

DO
$$
DECLARE
    a integer := 8;
    b integer := 2;
    c integer;
	d integer;
	e integer;
BEGIN
    c := a + b;
	d := a - b;
	e := a * b;
    RAISE NOTICE 'a = % --- b = % --- a + b = % --- a - b = % --- a * b = %', a, b, c, d, e;
END
$$

4. Написать программу двумя способами 1 - использование IF, 2 - использование CASE. Объявите числовую переменную и присвоейте ей значение. 
Если число равно 5 - выведите на экран "Отлично". 4 - "Хорошо". 3 - Удовлетворительно". 2 - "Неуд". 
В остальных случаях выведите на экран сообщение, что введённая оценка не верна.

4.1

DO
$$
DECLARE
    grade_number integer := 5;
    grade_word varchar(255);
BEGIN
    IF grade_number = 5 THEN
        grade_word := 'Отлично';
    ELSIF grade_number = 4 THEN
        grade_word := 'Хорошо';
    ELSIF grade_number = 3 THEN
        grade_word := 'Удовлетворительно';
    ELSIF grade_number = 2 THEN
        grade_word := 'Неуд';
    ELSE
        grade_word := 'Неверная оценка';
    END IF;
    RAISE NOTICE '%', grade_word;
END
$$

4.2

DO
$$
DECLARE
    grade_number integer := 2;
    grade_word varchar(255);
BEGIN
    CASE grade_number
        WHEN 5 THEN
            grade_word := 'Отлично';
	WHEN 4 THEN
            grade_word := 'Хорошо';
	WHEN 3 THEN
            grade_word := 'Удовлетворительно';
	WHEN 2 THEN
            grade_word := 'Неуд';
	ELSE
            grade_word := 'Неверная оценка';
    END CASE;
    RAISE NOTICE '%', grade_word;
END
$$

5. Выведите все квадраты чисел от 20 до 30 3-мя разными способами (LOOP, WHILE, FOR).

5.1
DO
$$
DECLARE
    count integer := 20;
BEGIN
    LOOP
        IF count > 30 THEN
             EXIT;
        END IF;
        RAISE NOTICE '% * % = %', count, count, count * count;
	    count = count + 1;
    END LOOP;
END
$$

5.2

DO
$$
DECLARE
    count integer := 20;
BEGIN
    WHILE count <= 30 LOOP
        RAISE NOTICE '% * % = %', count, count, count * count;
	    count = count + 1;
    END LOOP;
END
$$

5.3

DO
$$
BEGIN
    FOR count IN 20..30 LOOP
        RAISE NOTICE '% * % = %', count, count, count * count;
	    count = count + 1;
    END LOOP;
END
$$
