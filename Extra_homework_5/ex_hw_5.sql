USE ex_lesson_4;

-- Получите друзей пользователя с id=1
-- (решение задачи с помощью представления “друзья”)
CREATE OR REPLACE VIEW friend
AS
SELECT 
	f.target_user_id AS friend,
    CONCAT(lastname, " ", firstname) AS "Фамилия и имя"
FROM friend_requests f
JOIN users u ON u.id = f.target_user_id
WHERE `status` = 'approved' AND initiator_user_id = 1
UNION
SELECT 
	initiator_user_id,
    CONCAT(lastname, " ", firstname) AS "Фамилия и имя"
FROM friend_requests f
JOIN users u ON u.id = f.target_user_id
WHERE `status` = 'approved' AND target_user_id = 1;

SELECT * FROM friend;

-- Создайте представление, в котором будут выводится все сообщения, в которых принимал
-- участие пользователь с id = 1.
CREATE OR REPLACE VIEW messages_user_id_1
AS
SELECT body
FROM messages
WHERE from_user_id = 1 OR to_user_id = 1; 

SELECT * FROM messages_user_id_1;

-- Получите список медиафайлов пользователя с количеством лайков(media m, likes l ,users u)
SELECT
	CONCAT(lastname, " ", firstname) AS "Фамилия и имя",
    m.id AS "id_file" ,
    m.filename,
    COUNT(media_id) AS count_like
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN users u ON u.id = m.user_id
GROUP BY media_id;

-- Получите количество групп у пользователей
SELECT  
	CONCAT(lastname, " ", firstname) AS "Фамилия и имя",
	COUNT(community_id) AS "количество групп"
FROM users_communities c
JOIN users u ON u.id = c.user_id
GROUP BY  user_id;

-- Вывести 3 пользователей с наибольшим количеством лайков за медиафайлы
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT
	CONCAT(lastname, " ", firstname) AS "Фамилия и имя",
    COUNT(media_id) AS count_like
FROM likes l
JOIN media m ON l.media_id = m.id
JOIN users u ON u.id = m.user_id
GROUP BY u.id
ORDER BY count_like DESC
LIMIT 3;