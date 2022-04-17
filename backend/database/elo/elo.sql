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

    SELECT value, Elo.id INTO elo0, elo_id0  FROM Elo
        WHERE item_id0 = Elo.item_id AND category_id = Elo.category_id AND concept_id = Elo.concept_id;
    SELECT value, Elo.id INTO elo1, elo_id1 FROM Elo
        WHERE item_id1 = Elo.item_id AND category_id = Elo.category_id AND concept_id = Elo.concept_id;

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
END ;