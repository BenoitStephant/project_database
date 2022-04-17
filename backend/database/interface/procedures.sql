DROP PROCEDURE IF EXISTS create_category;
CREATE PROCEDURE create_category(IN title CHAR(30), description VARCHAR(255), image_url VARCHAR(255), OUT id INT)
BEGIN
   INSERT INTO Category VALUE (NULL, title, description, image_url, current_date(), current_date());
   SET id = LAST_INSERT_ID();
END ;

DROP PROCEDURE  IF EXISTS remove_category;
CREATE PROCEDURE remove_category(IN category_id INT)
BEGIN
    DELETE FROM Category WHERE Category.id = category_id;
END;

DROP PROCEDURE IF EXISTS create_concept;
CREATE PROCEDURE create_concept(IN name VARCHAR(30), OUT id INT)
BEGIN
    INSERT INTO Concept VALUE (NULL, name, current_date());
    SET id = LAST_INSERT_ID();
END ;

DROP PROCEDURE IF EXISTS remove_concept;
CREATE PROCEDURE remove_concept(IN concept_id INT)
BEGIN
    DELETE FROM Concept WHERE Concept.id = concept_id;
END;

DROP PROCEDURE IF EXISTS create_item;
CREATE PROCEDURE  create_item(IN name CHAR(30), description VARCHAR(255), image_url VARCHAR(255), OUT id INT)
BEGIN
   INSERT INTO Category VALUE (NULL, title, description, image_url, current_date(), current_date());
   SET id = LAST_INSERT_ID();
END;
DROP PROCEDURE IF EXISTS remove_item;
CREATE PROCEDURE remove_item(IN item_id INT)
BEGIN
    DELETE FROM Item WHERE Item.id = item_id;
END;

DROP PROCEDURE IF EXISTS link_concept_to_category;
CREATE PROCEDURE link_concept_to_category(IN concept_id INT, category_id INT)
BEGIN
   INSERT INTO Category_concepts VALUE(category_id, concept_id);
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
   INSERT INTO Category_items VALUE(category_id, item_id);
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

DROP PROCEDURE IF EXISTS get_match_log ;
CREATE PROCEDURE get_match_log(IN user_id VARCHAR(36), IN page_nb INT, IN page_size INT)
BEGIN
DECLARE offset INT DEFAULT page_nb * page_size;
SELECT Ml.id, Ml.user_id, Ca.title, Co.name, I1.name, I2.name, Ml.elo_before0, Ml.elo_before1, Ml.winner, Ml.elo_after0, Ml.elo_after1, Ml.elo_after0 - Ml.elo_before0 AS difference, Ml.created_at
FROM (SELECT * FROM Match_log Ml WHERE Ml.user_id = user_id LIMIT offset, page_size) Ml
INNER JOIN Elo AS Elo0 ON Ml.elo_id0 = Elo0.id
INNER JOIN Elo as Elo1 ON Ml.elo_id1 = Elo1.id
INNER JOIN Item as I1 ON Elo0.item_id = I1.id
INNER JOIN Item as I2 ON Elo1.item_id = I2.id
INNER JOIN Concept Co on Elo0.concept_id = Co.id
INNER JOIN Category Ca on Elo0.category_id = Ca.id;
END ;