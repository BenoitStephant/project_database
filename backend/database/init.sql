CREATE DATABASE IF NOT EXISTS choose_one;
use choose_one;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(255),
    name VARCHAR(20),
    password VARCHAR(10),
    CONSTRAINT
        PRIMARY KEY (id)
);