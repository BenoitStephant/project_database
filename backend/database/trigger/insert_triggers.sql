USE choose_one;

DELIMITER //
DROP TRIGGER IF EXISTS category_item_propagator //
CREATE TRIGGER category_item_propagator
    AFTER INSERT ON Category_items
    FOR EACH ROW
BEGIN
    INSERT INTO Elo
    SELECT NULL, NEW.item_id, NEW.category_id, Cc.concept_id, 1500
    FROM (SELECT Cc.concept_id FROM Category_concepts Cc WHERE Cc.category_id = NEW.category_id) as Cc;
END //

DELIMITER //
DROP TRIGGER IF EXISTS category_item_delinker //
CREATE TRIGGER category_item_delinker
    AFTER DELETE ON Category_items
    FOR EACH ROW
BEGIN
    DELETE FROM Elo WHERE Elo.item_id = OLD.item_id AND Elo.category_id = OLD.category_id;
END //

DROP TRIGGER IF EXISTS category_concept_propagator //
CREATE TRIGGER category_concept_propagator
    AFTER INSERT ON Category_concepts
    FOR EACH ROW
BEGIN
    INSERT INTO Elo
    SELECT  NULL, Ci.item_id, NEW.category_id, NEW.concept_id, 1500
    FROM (SELECT Ci.item_id FROM Category_items Ci WHERE  Ci.category_id = NEW.category_id) as Ci;
END //

DROP TRIGGER IF EXISTS category_concept_delinker //
CREATE TRIGGER category_concept_delinker
    AFTER DELETE ON Category_concepts
    FOR EACH ROW
BEGIN
    DELETE FROM Elo WHERE Elo.category_id = OLD.category_id AND Elo.concept_id = OLD.concept_id;
END //
DELIMITER ;