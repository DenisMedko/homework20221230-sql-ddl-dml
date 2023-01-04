-- Создайте таблицу “workers” с полями (“id”, “birthday”, “name”, “salary”).
CREATE TABLE IF NOT EXISTS workers (
    id serial PRIMARY KEY,
    birthday date NOT NULL,
    name varchar(256) NOT NULL CHECK (name != ''),
    salary numeric(10, 2) NOT NULL CHECK (salary >= 0)
);

--Задачи на ALTER TABLE
--К уже созданной таблице добавте поля "is_male", "email" и "department".
ALTER TABLE IF EXISTS workers
ADD COLUMN IF NOT EXISTS is_male boolean NOT NULL,
ADD COLUMN IF NOT EXISTS email varchar(256) NOT NULL CHECK (email != ''),
ADD COLUMN IF NOT EXISTS department varchar(256) NOT NULL CHECK (department != '')
;
--Затем удалите поле "department" отдельной командой.
ALTER TABLE IF EXISTS workers DROP COLUMN IF EXISTS department
--Добавте столбцу salary значение по умолчанию в 150$;
ALTER TABLE IF EXISTS workers 
ALTER COLUMN salary SET DEFAULT 150
;
