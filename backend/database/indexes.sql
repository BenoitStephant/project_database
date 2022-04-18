/* -- Concepts queried par category
CREATE INDEX category_index ON Category_concepts(category_id);
-- Items queried par category
CREATE INDEX category_index ON Category_items(category_id);
-- Ordered et join par ces deux ID
CREATE INDEX elo_search_index ON Elo(item_id, concept_id, category_id);
CREATE INDEX elo_category_index ON Elo(category_id);
-- Toutes les requetes de l'API se font avec un user_id lookup
CREATE INDEX user_index ON Match_log(user_id);
-- Often queried
CREATE INDEX elo_index ON Match_log(elo_id0, elo_id1);
 */
