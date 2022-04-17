USE choose_one;
INSERT INTO Category
VALUES (NULL, 'Animals', 'The animal kingdom', 'img_url', current_date(), current_date()),
(NULL, 'Film', 'Pop culture icons', 'img_url', current_date(), current_date()),
(NULL, 'Painting', 'Works of art', 'img_url', current_date(), current_date()),
(NULL, 'Everyday Items', 'From the mundane to the life changer', 'img_url', current_date(), current_date());

INSERT INTO Concept
VALUES (NULL, 'Absorbing', CURRENT_DATE()),
       (NULL, 'Amusing', CURRENT_DATE()),
       (NULL, 'Captivating', CURRENT_DATE()),
       (NULL, 'Compelling', CURRENT_DATE()),
       (NULL, 'Diverting', CURRENT_DATE()),
       (NULL, 'Engaging', CURRENT_DATE()),
       (NULL, 'Engrossing', CURRENT_DATE()),
       (NULL, 'Entertaining', CURRENT_DATE()),
       (NULL, 'Enthralling', CURRENT_DATE());

INSERT INTO Item
VALUES (NULL, 'Cat', 'Goes MEOW', 'img_src', current_date()),
(NULL, 'Dog', 'Goes WOOF', 'img_src', current_date()),
(NULL, 'Pig', 'Goes OINK', 'img_src', current_date()),
(NULL, 'Chicken', 'Goes BAWK', 'img_src', current_date());

INSERT INTO User
VALUES ('aaaaa', 'Foo', 'unhashedForYourSafety', 0, 0, 1, CURRENT_DATE(), CURRENT_DATE());

call link_concept_to_category(1, 1);
call link_concept_to_category(2, 1);
call link_concept_to_category(3, 1);
call link_concept_to_category(4, 1);
call link_concept_to_category(5, 1);
call link_concept_to_category(6, 1);
call link_concept_to_category(7, 1);
call link_concept_to_category(1, 3);
call link_concept_to_category(2, 3);
call link_concept_to_category(3, 3);
call link_concept_to_category(4, 3);
call link_concept_to_category(5, 3);
call link_concept_to_category(6, 3);
call link_concept_to_category(7, 3);
call link_item_to_category(1,1);
call link_item_to_category(2,1);

call link_item_to_category(4,3);

call link_item_to_category(3,1);
call link_item_to_category(4,1);
call link_item_to_category(4,1);

