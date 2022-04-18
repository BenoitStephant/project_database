DROP PROCEDURE IF EXISTS link_concept_to_category;
CREATE PROCEDURE link_concept_to_category(IN concept_id INT, category_id INT)
BEGIN
   INSERT IGNORE INTO Category_concepts VALUE(category_id, concept_id);
END ;
DROP PROCEDURE IF EXISTS unlink_concept_to_category;
CREATE PROCEDURE unlink_concept_to_category(IN concept_id INT, category_id INT)
BEGIN
   DELETE FROM Category_concepts WHERE Category_concepts.concept_id = concept_id
                                   AND Category_concepts.category_id = category_id;
END ;

DROP PROCEDURE IF EXISTS link_item_to_category;
CREATE PROCEDURE link_item_to_category(IN item_id INT, category_id INT)
BEGIN
   INSERT IGNORE INTO Category_items VALUE(category_id, item_id);
END ;
DROP PROCEDURE IF EXISTS unlink_item_to_category;
CREATE PROCEDURE unlink_item_to_category(IN item_id INT, category_id INT)
BEGIN
   DELETE FROM Category_items WHERE Category_items.item_id = item_id
                                   AND Category_items.category_id = category_id;
END ;

DROP PROCEDURE IF EXISTS unlink_entire_concept ;
CREATE PROCEDURE unlink_entire_concept(IN concept_id INT)
BEGIN
    DELETE FROM Category_concepts WHERE Category_concepts.concept_id = concept_id;
END ;

DROP PROCEDURE IF EXISTS  unlink_entire_item;
CREATE PROCEDURE unlink_entire_item(IN item_id INT)
BEGIN
    DELETE FROM Category_items WHERE Category_items.item_id = item_id;
END ;

DROP PROCEDURE IF EXISTS unlink_entire_category ;
CREATE PROCEDURE  unlink_entire_category(IN category_id INT)
BEGIN
    DELETE FROM Category_items WHERE Category_items.category_id = category_id;
    DELETE FROM Category_concepts WHERE Category_concepts.category_id = category_id;
END ;

DROP PROCEDURE IF EXISTS pick_random_category ;
CREATE PROCEDURE pick_random_category()
BEGIN
    -- For an optimized random pick: http:;mysql.rjweb.org/doc.php/random
    -- Case: AUTO_INCREMENT with gaps, 1 or more rows returned
    -- First select is one-time:
    SELECT @min := MIN(id),
           @max := MAX(id)
        FROM Category;
    SELECT C.*
        FROM Category C
        JOIN ( SELECT id FROM
                ( SELECT id
                    FROM ( SELECT @min + (@max - @min + 1 - 50) * RAND() AS start FROM DUAL ) AS init
                    JOIN Category y
                    WHERE    y.id > init.start
                    ORDER BY y.id
                    LIMIT 50           -- Inflated to deal with gaps
                ) z ORDER BY RAND()
               LIMIT 1                -- number of rows desired (change to 1 if looking for a single row)
             ) r ON C.id = r.id;
END ;

DROP PROCEDURE IF EXISTS pick_concept_from_category ;
CREATE PROCEDURE pick_concept_from_category(IN category_id INT)
BEGIN
    -- For an optimized random pick: http:;mysql.rjweb.org/doc.php/random
    -- For the purposes of few concepts per category, this should do
    DECLARE random_concept INT;
    SET random_concept = (SELECT concept_id FROM Category_concepts Cc WHERE Cc.category_id = category_id ORDER BY RAND() LIMIT 1);
    SELECT * FROM Concept WHERE id = random_concept;
END ;

DROP PROCEDURE IF EXISTS pick_two_items_from_category ;
CREATE PROCEDURE pick_two_items_from_category(IN category_id INT)
BEGIN
    -- For an optimized random pick: http:;mysql.rjweb.org/doc.php/random
    -- For the purposes of few concepts per category, this should do
    SELECT * FROM (SELECT item_id  as id FROM Category_items Ci WHERE Ci.category_id = category_id ORDER BY RAND() LIMIT 2) Ci
        INNER JOIN Item ON Ci.id = Item.id;

END ;

DROP FUNCTION IF EXISTS concept_count;
CREATE FUNCTION concept_count(category_id INT)
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
DECLARE concept_count INT;
SELECT count(concept_id) FROM Category_concepts Cc WHERE Cc.category_id = category_id
INTO concept_count;
RETURN concept_count;
END;

DROP FUNCTION IF EXISTS item_count;
CREATE FUNCTION item_count(category_id INT)
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
DECLARE item_count INT;
SELECT count(item_id) FROM Category_items Ci WHERE Ci.category_id = category_id
INTO item_count;
RETURN item_count;
END;

DROP PROCEDURE IF EXISTS query_item_elo;
CREATE PROCEDURE query_item_elo(category_id INT, page_nb INT, page_size INT, reversed INT(1))
BEGIN
DECLARE item_size INT DEFAULT page_size * concept_count(category_id);
DECLARE offset INT DEFAULT page_nb * item_size;
SELECT I.id as item_id, I.name as item_name, I.description, I.image_url, C.id as concept_id, C.name as concept_name, Elo.value
FROM (SELECT * FROM Elo E WHERE E.category_id = category_id ORDER BY CASE WHEN reversed = 0 THEN E.item_id END ASC,
                                                                     CASE WHEN reversed != 0 THEN E.item_id END DESC,
                                                                     E.concept_id LIMIT offset, item_size ) Elo
INNER JOIN Item I ON Elo.item_id = I.id
INNER JOIN Concept C ON Elo.concept_id = C.id;
END;

DROP PROCEDURE IF EXISTS get_match_log ;
CREATE PROCEDURE get_match_log(IN user_id VARCHAR(36), IN page_nb INT, IN page_size INT)
BEGIN
DECLARE offset INT DEFAULT page_nb * page_size;
SELECT Ml.id, Ml.user_id, Ca.title, Co.name, I1.name, I2.name, Ml.elo_before0, Ml.elo_before1, Ml.winner, Ml.elo_after0, Ml.elo_after1, Ml.elo_after0 - Ml.elo_before0 AS difference, Ml.created_at
-- Pas besoin d'ORDER BY date car les tuples sont insert dans cet ordre
FROM (SELECT * FROM Match_log Ml WHERE Ml.user_id = user_id LIMIT offset, page_size) Ml
INNER JOIN Elo AS Elo0 ON Ml.elo_id0 = Elo0.id
INNER JOIN Elo as Elo1 ON Ml.elo_id1 = Elo1.id
INNER JOIN Item as I1 ON Elo0.item_id = I1.id
INNER JOIN Item as I2 ON Elo1.item_id = I2.id
INNER JOIN Concept Co on Elo0.concept_id = Co.id
INNER JOIN Category Ca on Elo0.category_id = Ca.id;
END ;

DROP PROCEDURE IF EXISTS get_privacy;
CREATE PROCEDURE get_privacy(IN user_id VARCHAR(36))
BEGIN
SELECT visible_match, visible_fav_category FROM User WHERE id = user_id;
END;

DROP PROCEDURE IF EXISTS set_privacy;
CREATE PROCEDURE set_privacy(IN user_id VARCHAR(36), IN i_visible_match INT(1), IN i_visible_fav_category INT(1))
BEGIN
UPDATE User U SET U.visible_match = i_visible_match, U.visible_fav_category = i_visible_fav_category WHERE U.id = user_id;
END;

DROP PROCEDURE IF EXISTS get_user;
CREATE PROCEDURE get_user(IN user_id VARCHAR(36))
BEGIN
SELECT * FROM User WHERE id = user_id;
END;


DROP PROCEDURE IF EXISTS get_user_by_name;
CREATE PROCEDURE get_user_by_name(IN username VARCHAR(50))
BEGIN
SELECT * FROM User WHERE username = username;
END;

DROP PROCEDURE IF EXISTS get_categories;
CREATE PROCEDURE get_categories()
BEGIN
SELECT * FROM Category;
END;

DROP PROCEDURE IF EXISTS create_category;
CREATE PROCEDURE create_category(IN title VARCHAR(30), IN description VARCHAR(255), IN image_url VARCHAR(255))
BEGIN
    INSERT INTO Category (`id`, `title`, `description`, `image_url`) VALUES (0, title, description, image_url);
END;

DROP PROCEDURE IF EXISTS get_favorite_category;
CREATE PROCEDURE get_favorite_category(IN user_id VARCHAR(36))
BEGIN
SELECT * FROM Category WHERE id = (SELECT favorite_category_id FROM User WHERE id = user_id);
END;

DROP PROCEDURE IF EXISTS create_concept;
CREATE PROCEDURE create_concept(IN name VARCHAR(30))
BEGIN
INSERT INTO Concept (`id`, `name`) VALUES (0, name);
END;

DROP PROCEDURE IF EXISTS get_concepts;
CREATE PROCEDURE get_concepts()
BEGIN
SELECT * FROM Concept;
END;

DROP PROCEDURE IF EXISTS get_concept_by_name;
CREATE PROCEDURE get_concept_by_name(IN name VARCHAR(30))
BEGIN
SELECT * FROM Concept WHERE name = name;
END;