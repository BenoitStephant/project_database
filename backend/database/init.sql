CREATE DATABASE IF NOT EXISTS choose_one;
use choose_one;

CREATE TABLE IF NOT EXISTS Category (
    id INT NOT NULL AUTO_INCREMENT,
    title CHAR(30) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Concept (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Category_concepts (
    category_id INT NOT NULL,
    concept_id INT NOT NULL,
    CONSTRAINT UC_Category_aspect
        UNIQUE (category_id, concept_id),
    CONSTRAINT
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (concept_id)
        REFERENCES Concept(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS User (
    id VARCHAR(36) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    match_played INT(4) DEFAULT 0 NOT NULL,
    average DECIMAL(8, 7) DEFAULT 1 NOT NULL,
    favorite_category_id INT NULL,
    visible_match INT(1) DEFAULT 0 NOT NULL,
    visible_fav_category INT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id),
    CONSTRAINT
        FOREIGN KEY (favorite_category_id)
        REFERENCES Category(id)
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Item (
    id INT NOT NULL AUTO_INCREMENT,
    name CHAR(30) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Category_items (
    category_id INT NOT NULL,
    item_id INT NOT NULL,
    CONSTRAINT UC_Category_aspect
        UNIQUE (category_id, item_id),
    CONSTRAINT
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (item_id)
        REFERENCES Item(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Elo (
    id INT NOT NULL AUTO_INCREMENT,
    item_id INT NOT NULL,
    category_id INT NOT NULL,
    concept_id INT NOT NULL,
    value INT(4) DEFAULT 0,
    CONSTRAINT
        PRIMARY KEY (id),
    CONSTRAINT
        FOREIGN KEY (item_id)
        REFERENCES Item(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (concept_id)
        REFERENCES Concept(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Match_log (
    id INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(36),
    elo_id0 INT NOT NULL,
    elo_id1 INT NOT NULL,
    elo_before0 INT(4) NOT NULL,
    elo_before1 INT(4) NOT NULL,
    winner INT(1) NOT NULL,
    elo_after0 INT(4) NOT NULL,
    elo_after1 INT(4) NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id),
    CONSTRAINT
        FOREIGN KEY (user_id)
        REFERENCES User(id)
        ON DELETE SET NULL,
    CONSTRAINT
        FOREIGN KEY (elo_id0)
        REFERENCES Elo(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (elo_id1)
        REFERENCES Elo(id)
        ON DELETE CASCADE
);

DROP TRIGGER IF EXISTS category_item_propagator ;
CREATE TRIGGER category_item_propagator
    AFTER INSERT ON Category_items
    FOR EACH ROW
BEGIN
    INSERT INTO Elo
    SELECT NULL, NEW.item_id, NEW.category_id, Cc.concept_id, 1500
    FROM (SELECT Cc.concept_id FROM Category_concepts Cc WHERE Cc.category_id = NEW.category_id) as Cc;
END ;

DROP TRIGGER IF EXISTS category_item_delinker ;
CREATE TRIGGER category_item_delinker
    AFTER DELETE ON Category_items
    FOR EACH ROW
BEGIN
    DELETE FROM Elo WHERE Elo.item_id = OLD.item_id AND Elo.category_id = OLD.category_id;
END ;

DROP TRIGGER IF EXISTS category_concept_propagator ;
CREATE TRIGGER category_concept_propagator
    AFTER INSERT ON Category_concepts
    FOR EACH ROW
BEGIN
    INSERT INTO Elo
    SELECT  NULL, Ci.item_id, NEW.category_id, NEW.concept_id, 1500
    FROM (SELECT Ci.item_id FROM Category_items Ci WHERE  Ci.category_id = NEW.category_id) as Ci;
END ;

DROP TRIGGER IF EXISTS category_concept_delinker ;
CREATE TRIGGER category_concept_delinker
    AFTER DELETE ON Category_concepts
    FOR EACH ROW
BEGIN
    DELETE FROM Elo WHERE Elo.category_id = OLD.category_id AND Elo.concept_id = OLD.concept_id;
END ;