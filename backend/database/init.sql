CREATE DATABASE IF NOT EXISTS choose_one;
use choose_one;

CREATE TABLE IF NOT EXISTS Category (
    id VARCHAR(36) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    category_aspects_id VARCHAR(36) NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS User (
    id VARCHAR(36) NOT NULL,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    match_nb INT(4) NOT NULL,
    average DOUBLE(40, 2) NOT NULL,
    favorite_category_id VARCHAR(36),
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id),
    CONSTRAINT
        FOREIGN KEY (favorite_category_id)
        REFERENCES Category(id)
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Aspect (
    id VARCHAR(36) NOT NULL,
    title CHAR(30) NOT NULL,
    category_id VARCHAR(36),
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Item (
    id VARCHAR(36) NOT NULL,
    category_id VARCHAR(36) NOT NULL,
    name CHAR(30) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image_url CHAR(255) NOT NULL,
    elo DOUBLE(40, 2) NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id),
    CONSTRAINT
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Choose (
    id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36),
    category_id VARCHAR(36) NOT NULL,
    aspect_id VARCHAR(36) NOT NULL,
    item0 VARCHAR(36) NOT NULL,
    item1 VARCHAR(36) NOT NULL,
    elo_before0 VARCHAR(36) NOT NULL,
    elo_before1 VARCHAR(36) NOT NULL,
    winner INT(1) NOT NULL,
    elo_after0 VARCHAR(36) NOT NULL,
    elo_after1 VARCHAR(36) NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT
        PRIMARY KEY (id),
    CONSTRAINT
        FOREIGN KEY (user_id)
        REFERENCES User(id)
        ON DELETE SET NULL,
    CONSTRAINT
        FOREIGN KEY (item0)
        REFERENCES Item(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (item1)
        REFERENCES Item(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Category_aspect (
    aspect_id VARCHAR(36) NOT NULL,
    category_id VARCHAR(36) NOT NULL,
    CONSTRAINT UC_Category_aspect
        UNIQUE (aspect_id, category_id),
    CONSTRAINT
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
        ON DELETE CASCADE,
    CONSTRAINT
        FOREIGN KEY (aspect_id)
        REFERENCES Aspect(id)
        ON DELETE CASCADE
);