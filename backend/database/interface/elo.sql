USE choose_one;
DROP FUNCTION IF EXISTS calculate_rating_change;
CREATE FUNCTION calculate_rating_change(elo0 INT, elo1 INT, score DECIMAL(2,1))
RETURNS INT
DETERMINISTIC NO SQL
BEGIN
	DECLARE rating_change INT;
    DECLARE maximal_change INT DEFAULT 32;
    DECLARE elo_difference_for_10_times_more_likely INT DEFAULT 400;
    DECLARE win_probability DECIMAL(5,4);
    SET win_probability = 1 / (1 +
								POWER(10, ((elo1 - elo0)/elo_difference_for_10_times_more_likely))
                                );
	SET rating_change = maximal_change * ( score - win_probability );
    return rating_change;
END;

DROP FUNCTION IF EXISTS calculate_favorite_category;
CREATE FUNCTION calculate_favorite_category(user_id VARCHAR(36))
RETURNS INT
DETERMINISTIC CONTAINS SQL
BEGIN
    DECLARE fav INT;
    SELECT category_id FROM (SELECT E.category_id FROM (SELECT elo_id0 FROM Match_log Ml WHERE Ml.user_id = user_id) Ml
                                                        INNER JOIN Elo E ON Ml.elo_id0 = E.id) Ml
    GROUP BY category_id ORDER BY COUNT(category_id) DESC LIMIT 1
    INTO fav;
    RETURN fav;
END;

DROP FUNCTION IF EXISTS calculate_average_win;
CREATE FUNCTION calculate_average_win(average DECIMAL(8,7), match_played INT(4), chose_right INT(1))
RETURNS DECIMAL(8,7)
DETERMINISTIC NO SQL
BEGIN
    RETURN ((average * match_played) + chose_right) / (match_played + 1);
END;

DROP PROCEDURE IF EXISTS play_match ;
CREATE PROCEDURE play_match(IN item_id0 INT, item_id1 INT,
category_id INT, concept_id INT, score DECIMAL(2,1), user_id VARCHAR(36))
BEGIN
    DECLARE rating_change INT;
    DECLARE elo0 INT;
    DECLARE elo1 INT;
    DECLARE elo_after0 INT;
    DECLARE elo_after1 INT;
    DECLARE elo_id0 INT;
    DECLARE elo_id1 INT;
    DECLARE user_chose_right INT(1) DEFAULT 1;

    SELECT value, Elo.id INTO elo0, elo_id0  FROM Elo
        WHERE item_id0 = Elo.item_id AND concept_id = Elo.concept_id AND category_id = Elo.category_id;
    SELECT value, Elo.id INTO elo1, elo_id1 FROM Elo
        WHERE item_id1 = Elo.item_id AND concept_id = Elo.concept_id AND category_id = Elo.category_id;

    IF elo_id0 IS NULL OR elo_id1 IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No record matches this Category, concept and item combination';
    END IF;


    SET rating_change = calculate_rating_change(elo0, elo1, score);
    SET elo_after0 = elo0 + rating_change;
    SET elo_after1 = elo1 - rating_change;
    UPDATE Elo
        SET value = elo_after0
        WHERE Elo.id = elo_id0;
    UPDATE Elo
        SET value = elo_after1
        WHERE Elo.id = elo_id1;

    INSERT INTO Match_log VALUE (NULL, user_id, elo_id0, elo_id1, elo0, elo1, score, elo_after0, elo_after1, CURRENT_DATE());

    -- update user stats if they were logged in
    IF user_id IS NOT NULL THEN
        IF (elo0 > elo1 AND score < 0.5) THEN
            SET user_chose_right = 0;
        END IF;
        IF (elo0 < elo1 AND score > 0.5) THEN
            SET user_chose_right = 0;
        END IF;

        UPDATE User U SET U.average = calculate_average_win(U.average, U.match_played, user_chose_right)
        WHERE U.id = user_id;
        -- Just to be safe in update ordering, the query itself is cheap because it's the primary index
        UPDATE User U SET U.match_played = U.match_played + 1 WHERE U.id = user_id;
        UPDATE User U SET U.favorite_category_id = calculate_favorite_category(user_id) WHERE U.id = user_id;
    END IF;
END;