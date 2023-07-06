USE vk;
-- ****** Создать процедуру, которая решает следующую задачу
-- Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
-- а) из одного города
-- б) состоят в одной группе
-- в) друзья друзей

DROP PROCEDURE IF EXISTS select_users;
DELIMITER $$
CREATE PROCEDURE select_users (
the_id INT
)
 BEGIN
	SELECT 
		u.id, 
		u.firstname, 
        u.lastname
	FROM(SELECT 
			f.target_user_id AS id
		FROM(SELECT 
			a.initiator_user_id AS id 
            FROM( SELECT 
					f.initiator_user_id,
                    f.target_user_id
				FROM friend_requests f
				WHERE  f.`status` = 'approved')a
			WHERE a.target_user_id = the_id
		UNION
		SELECT 
			a.target_user_id AS id 
		FROM(SELECT 
				f.initiator_user_id,
				f.target_user_id
			FROM friend_requests f
            WHERE  f.`status` = 'approved')a
		WHERE a.initiator_user_id = the_id)fr
		JOIN friend_requests f ON fr.id = f.initiator_user_id
		WHERE  f.`status` = 'approved' AND  f.target_user_id != the_id
		UNION ALL
		SELECT 
		f.initiator_user_id AS id 
        FROM(SELECT 
				a.initiator_user_id as id 
			FROM(SELECT 
					f.initiator_user_id,
					f.target_user_id
				FROM friend_requests f
                WHERE  f.`status` = 'approved')a
		WHERE a.target_user_id = the_id
		UNION
		SELECT 
        a.target_user_id AS id 
        FROM(SELECT 
			f.initiator_user_id,
			f.target_user_id
			FROM friend_requests f
			WHERE  f.`status` = 'approved')a
		WHERE a.initiator_user_id = the_id) fr2
		JOIN friend_requests f ON fr2.id = f.target_user_id
		WHERE  f.`status` = 'approved' AND f.initiator_user_id != the_id) frfr
	LEFT JOIN users u
	ON u.id = frfr.id
	UNION 
	SELECT 
	u.id, u.firstname, u.lastname 
	FROM users u
	JOIN `profiles` p 
	ON u.id = p.user_id
	WHERE p.hometown =  ( SELECT hometown 
						FROM `profiles`
						WHERE user_id = the_id) AND user_id != the_id
	UNION
	SELECT 
	u.id, u.firstname, u.lastname 
	FROM(SELECT uc.user_id FROM (SELECT 
	community_id
	FROM users_communities 
	WHERE user_id = the_id) com
	JOIN users_communities uc
	ON com.community_id = uc.community_id
	WHERE uc.user_id != the_id) com2 
	JOIN users u ON u.id = com2.user_id
	ORDER BY RAND()
	LIMIT 5;
END $$
 
 CALL select_users(1);