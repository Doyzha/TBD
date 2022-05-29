/*Павел Дойжа 2255

Задание:

Сервис текстов песен  
Возможности:
1) Пользователь. Регистрация
2) Пользователь. Авторизация
3) Пользователь. Поиск песен по названию и исполнителю
4) Пользователь. Просмотр информации и слов песни
5) Пользователь. Возможность добавлять новую песню и строки текста
(требуется проверка модератором). К каждой строке (или сразу к
нескольким) может быть оставлено объяснение слов
6) Пользователь. Оценить объяснение слов, добавить к нему комментарий
7) Пользователь. Оставить комментарий к песне
8) Модератор. Принять песню
9) Модератор. Принять объяснение к показу

Создание таблиц:

Пользователей и модераторов
*/

CREATE TABLE "users" (
	"id" SERIAL NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"surname" VARCHAR(255) NULL DEFAULT NULL,
	"admin" BOOLEAN NOT NULL,
	PRIMARY KEY ("id")
);

--Песен  

CREATE TABLE "song" (	
	"id" SERIAL NOT NULL,
	"author" VARCHAR(255) NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"text" VARCHAR(255) NOT NULL,
	"explain" VARCHAR(255) DEFAULT NULL,  
	"published" BOOLEAN NOT NULL,
	PRIMARY KEY ("id")	
);

--Комментарий к песне

CREATE TABLE "song_score" (	
	"id" SERIAL NOT NULL,
	"user_id" INTEGER NOT NULL,
	"song_id" INTEGER NOT NULL,
	"comm" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("id"),	
	foreign key (user_id) references users (id),
	foreign key (song_id) references song (id)
);

--Оценка и комментарий к описанию строчек

CREATE TABLE "explain_score" (	
	"id" SERIAL NOT NULL,
	"user_id" INTEGER NOT NULL,
	"explain_id" INTEGER NOT NULL,
	"score" INTEGER NOT NULL,
	"comm" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("id"),
	foreign key (user_id) references users (id),
	foreign key (explain_id) references song (id)
);

--Регистрация пользователей

INSERT INTO "users" ("name", "admin") 
VALUES ('Третий', false)

--Добавление строчки песни и её объяснение
--Если published = true, значит песню и описание к ней одобрил модератор

INSERT INTO "song" ("author", "name", "text","explain", "published") 
VALUES ('Cool Guy', 'Cool song', 'Cool song! Cool song! Cool song!', 'Крутое', true)

--Оставление комментария к песне

INSERT INTO "song_comm" (
	"user_id",
	"song_id",
	"comm") 
VALUES (1, 1, 'Слишком круто! Мне не нравится')

--Оценка объяснения слов и комментарий к ней

INSERT INTO "explain_score" (
	"user_id",
	"explain_id",
	"score",
	"comm") 
VALUES (2, 1, 2, 'Неверное описание!!!')

--Поиск песен по названию и исполнителю

Select author, name from song
where author = 'Cool Guy' and published = true

Select author, name from song
where name = 'Cool song' and published = true

--Просмотр информации и слов песни

Select name, text, explain from song
where name = 'Cool song' and published = true