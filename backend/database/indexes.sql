-- Concepts queried par category
CREATE INDEX category_index ON Category_concepts(category_id);
-- Items queried par category
CREATE INDEX category_index ON Category_items(category_id);
-- Ordered et join par ces deux ID
CREATE INDEX item_with_concept_index ON Elo(item_id, concept_id);
-- Toutes les requetes de l'API se font avec un user_id lookup
CREATE INDEX user_index ON Match_log(user_id);