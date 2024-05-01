CREATE DATABASE FriendsOfHuman;

USE FriendsOfHuman;

CREATE TABLE `animal`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `animal_name` Varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);



CREATE TABLE `home_animal`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `home_name` Varchar(20) NOT NULL,
  `livePlace` Varchar(20),
  `id_animal` Int,
  PRIMARY KEY (`id`)
);



CREATE TABLE `cat`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `cat_name` Varchar(30) NOT NULL,
  `date_birth` Date NOT NULL,
  `commands` Varchar(200),
  `color` Varchar(20),
  `id_home` Int,
  PRIMARY KEY (`id`)
);



CREATE TABLE `dog`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `dog_name` Varchar(30) NOT NULL,
  `date_birth` Date NOT NULL,
  `commands` Varchar(200),
  `color` Varchar(20),
  `id_home` Int,
  PRIMARY KEY (`id`)
);


CREATE TABLE `hamster`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `hamster_name` Varchar(30) NOT NULL,
  `date_birth` Date NOT NULL,
  `commands` Varchar(200),
  `color` Varchar(20),
  `id_home` Int,
  PRIMARY KEY (`id`)
);


CREATE TABLE `pack_animal`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `pack_name` Varchar(20) NOT NULL,
  `livePlace` Varchar(20),
  `id_animal` Int,
  PRIMARY KEY (`id`)
);



CREATE TABLE `camel`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `name` Varchar(30) NOT NULL,
  `date_birth` Date NOT NULL,
  `commands` Varchar(200),
  `color` Varchar(20),
  `id_pack` Int,
  PRIMARY KEY (`id`)
);

---- Заполняем значениями
-- Добавляем данные в таблицу animal
INSERT INTO animal (animal_name) VALUES ('Cat'), ('Dog'), ('Hamster'), ('Camel'), ('Horse'), ('Mule');

-- Добавляем данные в таблицу home_animal
INSERT INTO home_animal (home_name, livePlace, id_animal) VALUES
('Fluffy', 'House', 1),
('Rex', 'Garden', 2),
('Nibbles', 'Cage', 3);

-- Добавляем данные в таблицы cat, dog и hamster
INSERT INTO cat (cat_name, date_birth, commands, color, id_home) VALUES
('Whiskers', '2018-05-10', 'Sleep, Play, Eat', 'Gray', 1),
('Smokey', '2019-02-15', 'Meow, Scratch', 'Black', 2);

INSERT INTO dog (dog_name, date_birth, commands, color, id_home) VALUES
('Buddy', '2017-07-20', 'Sit, Fetch, Roll Over', 'Brown', 2),
('Max', '2016-10-25', 'Stay, Shake, Speak', 'White', 2);

INSERT INTO hamster (hamster_name, date_birth, commands, color, id_home) VALUES
('Nibbles', '2020-04-05', 'Run, Eat, Sleep', 'Brown', 3),
('Fluffy', '2019-11-12', 'Run on Wheel, Eat Sunflower Seeds', 'White', 3);

-- Добавляем данные в таблицы pack_animal, camel, horse и mule
INSERT INTO pack_animal (pack_name, livePlace, id_animal) VALUES
('Desert Caravan', 'Desert', 4),
('Stable', 'Farm', 5),
('Pack Train', 'Mountain', 6);

INSERT INTO camel (name, date_birth, commands, color, id_pack) VALUES
('Amelia', '2015-08-20', 'Carry, Walk, Rest', 'Brown', 1),
('Oscar', '2017-04-12', 'Carry Cargo, Trek', 'Brown', 1);

INSERT INTO horse (name, date_birth, commands, color, id_pack) VALUES
('Thunder', '2016-06-30', 'Trot, Gallop, Jump', 'Brown', 2),
('Shadow', '2018-01-10', 'Walk, Canter, Pull', 'Black', 2);

INSERT INTO mule (name, date_birth, commands, color, id_pack) VALUES
('Molly', '2017-09-15', 'Carry Load, Trek, Rest', 'Gray', 3),
('Jack', '2019-03-25', 'Plow, Carry, Pull', 'Brown', 3);


CREATE TABLE `horse`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `name` Varchar(30) NOT NULL,
  `date_birth` Date NOT NULL,
  `commands` Varchar(200),
  `color` Varchar(20),
  `id_pack` Int,
  PRIMARY KEY (`id`)
);
--- Проверяем заполнение таблицу
-- Проверим таблицу animal
SELECT * FROM animal;

-- Проверим таблицу home_animal
SELECT * FROM home_animal;

-- Проверим таблицу cat
SELECT * FROM cat;

-- Проверим таблицу dog
SELECT * FROM dog;

-- Проверим таблицу hamster
SELECT * FROM hamster;

-- Проверим таблицу pack_animal
SELECT * FROM pack_animal;

-- Проверим таблицу camel
SELECT * FROM camel;

-- Проверим таблицу horse
SELECT * FROM horse;

-- Проверим таблицу mule
SELECT * FROM mule;





CREATE TABLE `mule`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `name` Varchar(30) NOT NULL,
  `date_birth` Date NOT NULL,
  `commands` Varchar(200),
  `color` Varchar(20),
  `id_pack` Int,
  PRIMARY KEY (`id`)
);



ALTER TABLE `home_animal` ADD CONSTRAINT `animal_to_home` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `cat` ADD CONSTRAINT `home_to_cat` FOREIGN KEY (`id_home`) REFERENCES `home_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `dog` ADD CONSTRAINT `home_to_dog` FOREIGN KEY (`id_home`) REFERENCES `home_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `hamster` ADD CONSTRAINT `home_to_hamster` FOREIGN KEY (`id_home`) REFERENCES `home_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `camel` ADD CONSTRAINT `pack_to_camel` FOREIGN KEY (`id_pack`) REFERENCES `pack_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `horse` ADD CONSTRAINT `pack_to_horse` FOREIGN KEY (`id_pack`) REFERENCES `pack_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `mule` ADD CONSTRAINT `pack_to_mule` FOREIGN KEY (`id_pack`) REFERENCES `pack_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--- Заполняем 
-- Добавляем данные в таблицу animal
INSERT INTO animal (animal_name) VALUES ('Cat'), ('Dog'), ('Hamster'), ('Camel'), ('Horse'), ('Mule');

-- Добавляем данные в таблицу home_animal
INSERT INTO home_animal (home_name, livePlace, id_animal) VALUES
('Fluffy', 'House', 1),
('Rex', 'Garden', 2),
('Nibbles', 'Cage', 3);

-- Добавляем данные в таблицы cat, dog и hamster
INSERT INTO cat (cat_name, date_birth, commands, color, id_home) VALUES
('Whiskers', '2018-05-10', 'Sleep, Play, Eat', 'Gray', 1),
('Smokey', '2019-02-15', 'Meow, Scratch', 'Black', 2);

INSERT INTO dog (dog_name, date_birth, commands, color, id_home) VALUES
('Buddy', '2017-07-20', 'Sit, Fetch, Roll Over', 'Brown', 2),
('Max', '2016-10-25', 'Stay, Shake, Speak', 'White', 2);

INSERT INTO hamster (hamster_name, date_birth, commands, color, id_home) VALUES
('Nibbles', '2020-04-05', 'Run, Eat, Sleep', 'Brown', 3),
('Fluffy', '2019-11-12', 'Run on Wheel, Eat Sunflower Seeds', 'White', 3);

-- Добавляем данные в таблицы pack_animal, camel, horse и mule
INSERT INTO pack_animal (pack_name, livePlace, id_animal) VALUES
('Desert Caravan', 'Desert', 4),
('Stable', 'Farm', 5),
('Pack Train', 'Mountain', 6);

INSERT INTO camel (name, date_birth, commands, color, id_pack) VALUES
('Amelia', '2015-08-20', 'Carry, Walk, Rest', 'Brown', 1),
('Oscar', '2017-04-12', 'Carry Cargo, Trek', 'Brown', 1);

INSERT INTO horse (name, date_birth, commands, color, id_pack) VALUES
('Thunder', '2016-06-30', 'Trot, Gallop, Jump', 'Brown', 2),
('Shadow', '2018-01-10', 'Walk, Canter, Pull', 'Black', 2);

INSERT INTO mule (name, date_birth, commands, color, id_pack) VALUES
('Molly', '2017-09-15', 'Carry Load, Trek, Rest', 'Gray', 3),
('Jack', '2019-03-25', 'Plow, Carry, Pull', 'Brown', 3);
--- Проверяем
-- Проверим таблицу animal
SELECT * FROM animal;

-- Проверим таблицу home_animal
SELECT * FROM home_animal;

-- Проверим таблицу cat
SELECT * FROM cat;

-- Проверим таблицу dog
SELECT * FROM dog;

-- Проверим таблицу hamster
SELECT * FROM hamster;

-- Проверим таблицу pack_animal
SELECT * FROM pack_animal;

-- Проверим таблицу camel
SELECT * FROM camel;

-- Проверим таблицу horse
SELECT * FROM horse;

-- Проверим таблицу mule
SELECT * FROM mule;



-- Удаляем данные о верблюдах из таблицы camel
DELETE FROM camel;

-- Объединяем таблицы horse и mule
CREATE TABLE equines AS
SELECT * FROM horse
UNION ALL
SELECT * FROM mule;

-- Удаляем старые таблицы horse и mule
DROP TABLE horse;
DROP TABLE mule;

-- Проверяем
-- Проверим таблицу camel
SELECT * FROM camel;

-- Проверим таблицу equines
SELECT * FROM equines;

-- Добавим данные в таблицы
-- Добавляем данные о кошках
INSERT INTO cat (cat_name, date_birth, color)
VALUES 
('Fluffy', '2020-02-10', 'Gray'),
('Whiskers', '2019-05-15', 'Black'),
('Mittens', '2018-08-20', 'White');

-- Добавляем данные о собаках
INSERT INTO dog (dog_name, date_birth, color)
VALUES 
('Buddy', '2019-01-20', 'Brown'),
('Max', '2018-04-25', 'Black'),
('Bailey', '2020-06-05', 'Golden');

-- Добавляем данные о хомяках
INSERT INTO hamster (hamster_name, date_birth, color)
VALUES 
('Nibbles', '2020-03-12', 'Brown'),
('Snowball', '2019-07-18', 'White'),
('Cinnamon', '2018-09-30', 'Orange');

--- Обновим данные чтобы они попали в таблицу
-- Обновляем дату рождения кошек
UPDATE cat SET date_birth = '2019-05-15' WHERE id = 3;
UPDATE cat SET date_birth = '2019-05-15' WHERE id = 4;
UPDATE cat SET date_birth = '2019-05-15' WHERE id = 5;

-- Обновляем дату рождения собак
UPDATE dog SET date_birth = '2019-01-20' WHERE id = 3;
UPDATE dog SET date_birth = '2019-01-20' WHERE id = 4;

-- Обновляем дату рождения хомяков
UPDATE hamster SET date_birth = '2019-07-18' WHERE id = 4;

-- Создадим таблицу молодых животных

CREATE TABLE young_animal (
id int NOT NULL,
name varchar(50),
date_birth Datetime,
commands varchar(200),
color varchar(20),
age varchar(50));
-- Добавляем животных
INSERT INTO young_animal (id, name, date_birth, commands, color, age)
SELECT id, cat_name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM cat
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36; 


INSERT INTO young_animal (id, name, date_birth, commands, color, age)
SELECT id, dog_name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM dog
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36; 


INSERT INTO young_animal (id, name, date_birth, commands, color, age)
SELECT id, name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM horse
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36 
UNION ALL
SELECT id, name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM mule
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36;

-- Создаем новую таблицу для объединения всех животных
CREATE TABLE all_animals AS
(
    SELECT id, 'cat' AS animal_type, cat_name AS name, date_birth, commands, color FROM cat
    UNION ALL
    SELECT id, 'dog' AS animal_type, dog_name AS name, date_birth, commands, color FROM dog
    UNION ALL
    SELECT id, 'hamster' AS animal_type, hamster_name AS name, date_birth, commands, color FROM hamster
    UNION ALL
    SELECT id, 'camel' AS animal_type, name, date_birth, commands, color FROM camel
    UNION ALL
    SELECT id, 'equines' AS animal_type, name, date_birth, commands, color FROM equines
);

-- Проверяем результат
SELECT * FROM all_animals;
