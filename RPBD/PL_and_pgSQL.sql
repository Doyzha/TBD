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

6. Последовательность Коллатца. Берётся любое натуральное число. Если чётное - делим его на 2, если нечётное, то умножаем его на 3 и прибавляем 1. 
Такие действия выполняются до тех пор, пока не будет получена единица. Гипотеза заключается в том, что какое бы начальное число n не было выбрано, 
всегда получится 1 на каком-то шаге. 
Задания: написать функцию, входной параметр - начальное число, на выходе - количество чисел, пока не получим 1; написать процедуру, 
которая выводит все числа последовательности. 
Входной параметр - начальное число.

DO
$$
DECLARE
    i integer := 1;
    n integer := 7;
BEGIN
    WHILE NOT n = 1 LOOP
	CASE n % 2
            WHEN 0 THEN
                n = n / 2;
            WHEN 1 THEN
                n = n * 3 + 1;
            END CASE;
        RAISE NOTICE 'Шаг №%. Число n = %', i, n;
        i = i + 1;
    END LOOP;
END
$$

7. Числа Люка. Объявляем и присваиваем значение переменной - количество числе Люка. Вывести на экран последовательность чисел. 
Где L0 = 2, L1 = 1 ; Ln=Ln-1 + Ln-2 (сумма двух предыдущих чисел). 
Задания: написать фунцию, входной параметр - количество чисел, на выходе - последнее число (Например: входной 5, 2 1 3 4 7 - на выходе число 7); 
написать процедуру, которая выводит все числа последовательности. Входной параметр - количество чисел.

CREATE OR REPLACE FUNCTION lucas_numbers(count integer) RETURNS integer ARRAY
AS $$
DECLARE
    numbers integer[];
BEGIN
    numbers[0] = 5;
    numbers[1] = 2;
	FOR i IN 2..count LOOP
	    numbers[i] = numbers[i-1] + numbers[i-2];
	END LOOP;
	RAISE NOTICE '%', numbers;
    RETURN numbers;
END
$$ LANGUAGE plpgsql;

SELECT lucas_numbers(5);

8. Напишите функцию, которая возвращает количество человек родившихся в заданном году.

CREATE OR REPLACE FUNCTION get_user_count_birthdate(year_date integer) RETURNS integer
AS $$
DECLARE
    answer integer;
BEGIN
    SELECT COUNT(*) INTO STRICT answer FROM people WHERE date_part('year', people.birth_date) = year_date;
    RETURN answer;
END
$$ LANGUAGE plpgsql;

SELECT get_user_count_birthdate(2003);

9. Напишите функцию, которая возвращает количество человек с заданным цветом глаз.

CREATE OR REPLACE FUNCTION get_user_count_eyes_color(eyes_color character varying) RETURNS integer
AS $$
DECLARE
    answer integer;
BEGIN
    SELECT COUNT(*) INTO STRICT answer FROM people WHERE people.eyes = eyes_color;
    RETURN answer;
END
$$ LANGUAGE plpgsql;

SELECT get_user_count_eyes_color('blue');

10. Напишите функцию, которая возвращает ID самого молодого человека в таблице.

CREATE OR REPLACE FUNCTION get_junior_user_id() RETURNS integer
AS $$
DECLARE
    answer integer;
BEGIN
    SELECT id INTO STRICT answer FROM people WHERE birth_date = (SELECT MAX(birth_date) FROM people);
    RETURN answer;
END
$$ LANGUAGE plpgsql;

SELECT get_junior_user_id();

11. Напишите процедуру, которая возвращает людей с индексом массы тела больше заданного. ИМТ = масса в кг / (рост в м)^2.

CREATE OR REPLACE PROCEDURE get_users_by(imt IN real, answer OUT integer[])
LANGUAGE plpgsql
AS $$
DECLARE
    p people%ROWTYPE;
    answer integer[];
    count integer := 0;
BEGIN
    FOR p IN SELECT * FROM people LOOP
        IF (p.weight / (p.growth / 100)^2) > imt THEN
            answer[count] = p.id;
            count = count + 1;
        END IF;
    END LOOP;
    RAISE NOTICE '%', answer;
END;
$$;

CALL get_users_by(15.0);

12. Измените схему БД так, чтобы в БД можно было хранить родственные связи между людьми. Код должен быть представлен в виде транзакции 
(Например (добавление атрибута): BEGIN; ALTER TABLE people ADD COLUMN leg_size REAL; COMMIT;). Дополните БД данными.

BEGIN; 
ALTER TABLE people ADD COLUMN related_id integer; 
COMMIT;

INSERT INTO people(name, surname, birth_date, growth, weight, eyes, hair, related_id)
VALUES 
('pablo','italiaty', '2000-01-23', 176.3, 59.3, 'blue', 'brown', 1),
('mason', 'italiaty', '2000-02-02', 182.2, 63.2, 'brown', 'brown', 1);

13. Напишите процедуру, которая позволяет создать в БД нового человека с указанным родством.

CREATE OR REPLACE PROCEDURE add_new_person(
    name IN varchar(255),
    surname IN varchar(255),
    birth_date IN DATE,
    growth IN real,
    weight IN real,
    eyes IN varchar(255),
    hair IN varchar(255),
    related_id IN integer
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO people(name, surname, birth_date, growth, weight, eyes, hair, related_id)
               VALUES (name, surname, birth_date, growth, weight, eyes, hair, related_id);
END;
$$;

CALL add_new_person('lex', 'lexman', '1995-03-10', 189.5, 75.9, 'brown', 'brown', 5);

14. Измените схему БД так, чтобы в БД можно было хранить время актуальности данных человека (выполнить также, как п.12).

BEGIN; 
ALTER TABLE people ADD COLUMN last_changes timestamp; 
COMMIT;

INSERT INTO people(name, surname, birth_date, growth, weight, eyes, hair, related_id, last_changes)
VALUES 
('alex', 'orlov', '1969-12-16', 170.6, 70.4, 'blue', 'brown', 4, NOW());

15. Напишите процедуру, которая позволяет актуализировать рост и вес человека.

CREATE OR REPLACE PROCEDURE growth_and_weight_update(people_id IN integer, new_growth IN real, new_weight IN real)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE people SET growth = new_growth, weight = new_weight, last_changes = NOW() WHERE id = people_id;
END;
$$;

CALL growth_and_weight_update(5, 171.1, 52.3);
