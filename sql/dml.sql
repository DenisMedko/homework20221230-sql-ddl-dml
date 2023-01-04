--Задачи на INSERT
--Добавьте нового работника Никиту, 90го года, зарплата 300$.
INSERT INTO workers (
    birthday,
    name,
    salary,
    email
)
VALUES (
    '01-01-1990',
    'Nikita',
    300,
    'Nikita@gmail.com'
);
--Добавьте нового работника Светлану с зарплатой 1200$.
INSERT INTO workers (
    birthday,
    name,
    is_male,
    salary,
    email
)
VALUES (
    '25-01-1990',
    'Svetlana',
    false,
    1200,
    'Svetlana@gmail.com'
);
--Добавьте двух новых работников одним запросом: Ярослава с зарплатой 1200$ и годом 80го, 
--Петра с зарплатой 1000$ и 93 года.
--(Так же добавте еще несколько пользователей чтобы раздуть табличку и иметь 
--возможность делать задачки из следующего блока)
INSERT INTO workers (
    birthday,
    name,
    is_male,
    salary,
    email
)
VALUES (
    '01-01-1980',
    'Jaroslav',
    true,
    1200,
    'Jaroslav@gmail.com'
),
(
    '02-03-1993',
    'Piter',
    true,
    1000,
    'Piter@gmail.com'
),
(
    '04-12-1984',
    'Julia',
    false,
    1100,
    'Julia@gmail.com'
),
(
    '05-11-1979',
    'Sandra',
    false,
    1600,
    'Sandra@gmail.com'
);
--Задачи на UPDATE
--Поставьте Никите зарплату в 425$.
UPDATE 
    workers 
SET 
    salary = 425 
WHERE 
    name = 'Nikita'
;
--Работнику с id=4 измените дату рождения так, чтобы год рождения стал 75-ым.
UPDATE 
    workers 
SET 
    birthday = make_date(
        1975,
        extract (month from birthday)::integer , 
        extract (day from birthday)::integer
    )  
WHERE 
    id = 4
;
--Работникам-женщинам с id больше 2 и меньше 5 включительно установите заплату в 600$.
UPDATE 
    workers 
SET 
    salary = 600
WHERE 
    NOT is_male 
    AND id BETWEEN 2 AND 5
;
--Поменяйте Васю на Женю и поменяйте почту.
UPDATE 
    workers 
SET 
    name = 'Yeugen',
    email = 'Yeugen@gmail.com'
WHERE 
    name = 'Nikita'
;
--Задачи на DELETE
--Удалите работника с id=2.
DELETE FROM 
    workers 
WHERE 
    id = 2
RETURNING *
;
--Удалите всех Николаев.
DELETE FROM 
    workers 
WHERE 
    name = 'Nikolay'
RETURNING *
;
--Удалите всех работников, у которых зарплата меньше 200$.
DELETE FROM 
    workers 
WHERE 
    salary < 200
RETURNING *
;