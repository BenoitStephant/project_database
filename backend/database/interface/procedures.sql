DELIMITER //

DROP PROCEDURE IF EXISTS create_category//
CREATE PROCEDURE create_category(IN title CHAR(30), description VARCHAR(255), image_url VARCHAR(255), OUT id INT)
BEGIN
   INSERT INTO Category VALUE (NULL, title, description, image_url, current_date(), current_date());
   SET id = LAST_INSERT_ID();
END //

DROP PROCEDURE  IF EXISTS remove_category//
CREATE PROCEDURE remove_category(IN category_id INT)
BEGIN
    DELETE FROM Category WHERE Category.id = category_id;
END//

DROP PROCEDURE IF EXISTS create_concept//
CREATE PROCEDURE create_concept(IN name VARCHAR(30), OUT id INT)
BEGIN
    INSERT INTO Concept VALUE (NULL, name, current_date());
    SET id = LAST_INSERT_ID();
END //

DROP PROCEDURE IF EXISTS remove_concept//
CREATE PROCEDURE remove_concept(IN concept_id INT)
BEGIN
    DELETE FROM Concept WHERE Concept.id = concept_id;
END//

DROP PROCEDURE IF EXISTS create_item//
CREATE PROCEDURE  create_item(IN name CHAR(30), description VARCHAR(255), image_url VARCHAR(255), OUT id INT)
BEGIN
   INSERT INTO Category VALUE (NULL, title, description, image_url, current_date(), current_date());
   SET id = LAST_INSERT_ID();
END//
DROP PROCEDURE IF EXISTS remove_item//
CREATE PROCEDURE remove_item(IN item_id INT)
BEGIN
    DELETE FROM Item WHERE Item.id = item_id;
END//

DROP PROCEDURE IF EXISTS link_concept_to_category//
CREATE PROCEDURE link_concept_to_category(IN concept_id INT, category_id INT)
BEGIN
   INSERT INTO Category_concepts VALUE(category_id, concept_id);
END //
DROP PROCEDURE IF EXISTS unlink_concept_to_category//
CREATE PROCEDURE unlink_concept_to_category(IN concept_id INT, category_id INT)
BEGIN
   DELETE FROM Category_concepts WHERE Category_concepts.concept_id = concept_id
                                   AND Category_concepts.category_id = category_id;
END //

DROP PROCEDURE IF EXISTS link_item_to_category//
CREATE PROCEDURE link_item_to_category(IN item_id INT, category_id INT)
BEGIN
   INSERT INTO Category_items VALUE(category_id, item_id);
END //
DROP PROCEDURE IF EXISTS unlink_item_to_category//
CREATE PROCEDURE unlink_item_to_category(IN item_id INT, category_id INT)
BEGIN
   DELETE FROM Category_items WHERE Category_items.item_id = item_id
                                   AND Category_items.category_id = category_id;
END //

DROP PROCEDURE IF EXISTS unlink_entire_concept;
CREATE PROCEDURE unlink_entire_concept(IN concept_id INT)
BEGIN
    DELETE FROM Category_concepts WHERE Category_concepts.concept_id = concept_id;
END //

DROP PROCEDURE IF EXISTS  unlink_entire_item;
CREATE PROCEDURE unlink_entire_item(IN item_id INT)
BEGIN
    DELETE FROM Category_items WHERE Category_items.item_id = item_id;
END //

DROP PROCEDURE IF EXISTS unlink_entire_category;
CREATE PROCEDURE  unlink_entire_category(IN category_id INT)
BEGIN
    DELETE FROM Category_items WHERE Category_items.category_id = category_id;
    DELETE FROM Category_concepts WHERE Category_concepts.category_id = category_id;
END //

DROP PROCEDURE IF EXISTS pick_concept_from_category;
CREATE PROCEDURE pick_concept_from_category(IN category_id INT)
BEGIN
    -- For an optimized random pick: http://mysql.rjweb.org/doc.php/random
    -- For the purposes of few concepts per category, this should do
    DECLARE random_concept INT;
    SET random_concept = (SELECT concept_id FROM Category_concepts Cc WHERE Cc.category_id = category_id ORDER BY RAND() LIMIT 1);
    SELECT * FROM Concept WHERE id = random_concept;
END //

DROP PROCEDURE IF EXISTS pick_two_items_from_category;
CREATE PROCEDURE pick_two_items_from_category(IN category_id INT)
BEGIN
    -- For an optimized random pick: http://mysql.rjweb.org/doc.php/random
    -- For the purposes of few concepts per category, this should do
    SELECT * FROM (SELECT item_id FROM Category_items Ci WHERE Ci.category_id = category_id ORDER BY RAND() LIMIT 2) Ci
        INNER JOIN Item ON Ci.item_id = Item.id;
END //

DELIMITER ;