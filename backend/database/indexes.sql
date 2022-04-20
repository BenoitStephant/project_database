-- Utility Function to add an index if not present from https://dba.stackexchange.com/questions/24531/mysql-create-index-if-not-exists
DROP PROCEDURE IF EXISTS create_index;
CREATE PROCEDURE create_index
(
    given_database VARCHAR(64),
    given_table    VARCHAR(64),
    given_index    VARCHAR(64),
    given_columns  VARCHAR(64)
)
BEGIN

    DECLARE IndexIsThere INTEGER;

    SELECT COUNT(1) INTO IndexIsThere
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE table_schema = given_database
    AND   table_name   = given_table
    AND   index_name   = given_index;

    IF IndexIsThere = 0 THEN
        SET @sqlstmt = CONCAT('CREATE INDEX ',given_index,' ON ',
        given_database,'.',given_table,' (',given_columns,')');
        PREPARE st FROM @sqlstmt;
        EXECUTE st;
        DEALLOCATE PREPARE st;
    ELSE
        SELECT CONCAT('Index ',given_index,' already exists on Table ',
        given_database,'.',given_table) CreateindexErrorMessage;
    END IF;
END;

-- Concepts queried par category
-- CREATE INDEX category_index ON Category_concepts(category_id);
call create_index('choose_one', 'Category_concepts', 'category_index', 'category_id');

-- Items queried par category
-- CREATE INDEX category_index ON Category_items(category_id);
call create_index('choose_one', 'Category_items', 'category_index', 'category_id');

-- Ordered et join par ces deux ID
-- CREATE INDEX elo_search_index ON Elo(item_id, concept_id, category_id);
-- CREATE INDEX elo_category_index ON Elo(category_id);
call create_index('choose_one', 'Elo', 'elo_search_index', 'item_id,concept_id,category_id');
call create_index('choose_one', 'Elo', 'elo_category_index', 'category_id');

-- Toutes les requetes de l'API se font avec un user_id lookup
-- CREATE INDEX user_index ON Match_log(user_id);
call create_index('choose_one', 'Match_log', 'user_index', 'user_id');

-- Often queried
-- CREATE INDEX elo_index ON Match_log(elo_id0, elo_id1);
call create_index('choose_one', 'Match_log', 'elo_index', 'elo_id0,elo_id1');
