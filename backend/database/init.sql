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
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    match_played INT(4) DEFAULT 0 NOT NULL,
    average DOUBLE(40, 2) DEFAULT 1 NOT NULL,
    favorite_category_id INT NULL,
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
    image_url CHAR(255) NOT NULL,
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

CREATE TABLE IF NOT EXISTS Password (
    user_id INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT
        FOREIGN KEY (user_id)
        REFERENCES User(id)
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
    user_id INT,
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