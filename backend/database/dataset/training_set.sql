INSERT INTO Category
VALUES (NULL, 'Animals', 'The animal kingdom', 'img_url', current_date(), current_date()),
(NULL, 'Films', 'Pop culture icons', 'img_url', current_date(), current_date()),
(NULL, 'Books', 'Literary engaging', 'img_url', current_date(), current_date()),
(NULL, 'Paintings', 'Works of art', 'img_url', current_date(), current_date());

INSERT INTO Concept
VALUES (NULL, 'Active', CURRENT_DATE()),
       (NULL, 'Agile', CURRENT_DATE()),
       (NULL, 'Beautiful', CURRENT_DATE()),
       (NULL, 'Calm', CURRENT_DATE()),
       (NULL, 'Clever', CURRENT_DATE()),
       (NULL, 'Defiant', CURRENT_DATE()),
       (NULL, 'Entertaining', CURRENT_DATE()),
       (NULL, 'Fast', CURRENT_DATE()),
       (NULL, 'Friendly', CURRENT_DATE()),
       (NULL, 'Independent', CURRENT_DATE()),
       (NULL, 'Keen', CURRENT_DATE()),
       (NULL, 'Lazy', CURRENT_DATE()),
       (NULL, 'Lovable', CURRENT_DATE()),
       (NULL, 'Majestic', CURRENT_DATE()),
       (NULL, 'Moody', CURRENT_DATE()),
       (NULL, 'Needy', CURRENT_DATE()),
       (NULL, 'Nervous', CURRENT_DATE()),
       (NULL, 'Quiet', CURRENT_DATE()),
       (NULL, 'Shy', CURRENT_DATE()),
       (NULL, 'Smelly', CURRENT_DATE()),
       (NULL, 'Stubborn', CURRENT_DATE()),
       (NULL, 'Though', CURRENT_DATE()),
       (NULL, 'Unique', CURRENT_DATE()),
       (NULL, 'Wild', CURRENT_DATE()),
       (NULL, 'Trustworthy', CURRENT_DATE());

call link_concept_to_category(1,1);
call link_concept_to_category(2,1);
call link_concept_to_category(3,1);
call link_concept_to_category(4,1);
call link_concept_to_category(5,1);
call link_concept_to_category(6,1);
call link_concept_to_category(7,1);
call link_concept_to_category(8,1);
call link_concept_to_category(9,1);
call link_concept_to_category(10,1);
call link_concept_to_category(11,1);
call link_concept_to_category(12,1);
call link_concept_to_category(13,1);
call link_concept_to_category(14,1);
call link_concept_to_category(15,1);
call link_concept_to_category(16,1);
call link_concept_to_category(17,1);
call link_concept_to_category(18,1);
call link_concept_to_category(19,1);
call link_concept_to_category(20,1);
call link_concept_to_category(21,1);
call link_concept_to_category(22,1);
call link_concept_to_category(23,1);
call link_concept_to_category(24,1);
call link_concept_to_category(25,1);

INSERT INTO Item
VALUES (NULL, 'Alligator', 'See you later', 'https://animalcorner.org/wp-content/uploads/2015/02/alligator1-1-150x150.jpg', current_date()),
    (NULL, 'Armadillo', 'Get the ball rolling', 'https://animalcorner.org/wp-content/uploads/2015/02/armadillo-1-150x150.jpg', current_date()),
    (NULL, 'Puffin', 'Bright beak', 'https://animalcorner.org/wp-content/uploads/2015/02/atlantic-puffin-2-150x150.jpg', current_date()),
    (NULL, 'Axolotl', 'Grows back limbs', 'https://animalcorner.org/wp-content/uploads/2022/04/1024px-Ambystoma_mexicanum_6337857516-7927249-150x150.jpeg', current_date()),
    (NULL, 'Goose', 'Might steal your bread', 'https://animalcorner.org/wp-content/uploads/2015/02/bean-goose-1-150x150.jpg', current_date()),
    (NULL, 'Tiger', 'Black and orange', 'https://animalcorner.org/wp-content/uploads/2015/02/bengal-tiger-1-150x150.jpg', current_date()),
    (NULL, 'Bison', 'Tank on hooves', 'https://animalcorner.org/wp-content/uploads/2015/02/bison-1-150x150.jpg', current_date()),
    (NULL, 'Ferret', 'Noodle with fur', 'https://animalcorner.org/wp-content/uploads/2022/03/Black-Footed-Ferret-150x150.png', current_date()),
    (NULL, 'Rhino', 'One horned giant', 'https://animalcorner.org/wp-content/uploads/2015/02/black-rhino-1-150x150.jpg', current_date()),
    (NULL, 'Macaw', 'Might talk back', 'https://animalcorner.org/wp-content/uploads/2015/02/blue-and-yellow-macaw-1-150x150.jpg', current_date()),
    (NULL, 'Whale', 'Biggest swimmers', 'https://animalcorner.org/wp-content/uploads/2015/02/bowhead-whale-150x150.jpg', current_date()),
    (NULL, 'Mole', 'Blind burrowed', 'https://animalcorner.org/wp-content/uploads/2015/02/british-mole-1-150x150.jpg', current_date()),
    (NULL, 'Mice', 'Squeaks', 'https://animalcorner.org/wp-content/uploads/2015/02/british-harvest-mouse-1-150x150.jpg', current_date()),
    (NULL, 'Cat', 'Grows meow', 'https://animalcorner.org/wp-content/uploads/2015/02/british-wild-cat-1-150x150.jpg', current_date()),
    (NULL, 'Capybara', 'One very big rodent', 'https://animalcorner.org/wp-content/uploads/2015/02/capybara-1-150x150.jpg', current_date()),
    (NULL, 'Caracal', 'Big floopa', 'https://animalcorner.org/wp-content/uploads/2015/02/caracal-1-150x150.jpg', current_date()),
    (NULL, 'Cheeta', 'Very fast land animal', 'https://animalcorner.org/wp-content/uploads/2015/02/cheetah1-1-150x150.jpg', current_date()),
    (NULL, 'Chicken', 'Goes BAWK', 'https://animalcorner.org/wp-content/uploads/2015/02/chicken2-1-150x150.jpg', current_date()),
    (NULL, 'Chinchilla', 'The fluff never ends', 'https://animalcorner.org/wp-content/uploads/2015/02/chinchilla-1-150x150.jpg', current_date()),
    (NULL, 'Chipmunk', 'Big cheeks', 'https://animalcorner.org/wp-content/uploads/2015/02/chipmunk-1-150x150.jpg', current_date()),
    (NULL, 'Penguin', 'Cannot fly', 'https://animalcorner.org/wp-content/uploads/2015/02/chinstrap-penguin-1-150x150.jpg', current_date()),
    (NULL, 'Frog', 'Ribbit', 'https://animalcorner.org/wp-content/uploads/2015/02/common-frog-1-150x150.jpg', current_date()),
    (NULL, 'Hippopotamus', 'Will absolutely ruin your day', 'https://animalcorner.org/wp-content/uploads/2015/02/hippo-1-150x150.jpg', current_date()),
    (NULL, 'Cow', 'Goes Moo', 'https://animalcorner.org/wp-content/uploads/2015/02/cows-1-150x150.jpg', current_date()),
    (NULL, 'Coyote', 'Goes Moo', 'https://animalcorner.org/wp-content/uploads/2015/02/coyote-1-150x150.jpg', current_date()),
    (NULL, 'Crocodile', 'See you in a while', 'https://animalcorner.org/wp-content/uploads/2015/02/crocodile-1-150x150.jpg', current_date()),
    (NULL, 'Deer', 'Silly Antlers', 'https://animalcorner.org/wp-content/uploads/2015/02/deer-1-150x150.jpg', current_date()),
    (NULL, 'Dog', 'Goes woof', 'https://animalcorner.org/wp-content/uploads/2015/02/dog3-1-150x150.jpg', current_date()),
    (NULL, 'Pig', 'Goes hoink', 'https://animalcorner.org/wp-content/uploads/2015/02/domestic-pig-1-150x150.jpg', current_date()),
    (NULL, 'Dolphin', 'Sea mammal', 'https://animalcorner.org/wp-content/uploads/2015/02/dolphins-1-150x150.jpg', current_date()),
    (NULL, 'Rabbit', 'Will much a lot', 'https://animalcorner.org/wp-content/uploads/2015/02/rabbits-150x150.png', current_date()); -- 31

call link_item_to_category(1, 1);
call link_item_to_category(2, 1);
call link_item_to_category(3, 1);
call link_item_to_category(4, 1);
call link_item_to_category(5, 1);
call link_item_to_category(6, 1);
call link_item_to_category(7, 1);
call link_item_to_category(8, 1);
call link_item_to_category(9, 1);
call link_item_to_category(10, 1);
call link_item_to_category(11, 1);
call link_item_to_category(12, 1);
call link_item_to_category(13, 1);
call link_item_to_category(14, 1);
call link_item_to_category(15, 1);
call link_item_to_category(16, 1);
call link_item_to_category(17, 1);
call link_item_to_category(18, 1);
call link_item_to_category(19, 1);
call link_item_to_category(20, 1);
call link_item_to_category(21, 1);
call link_item_to_category(22, 1);
call link_item_to_category(23, 1);
call link_item_to_category(24, 1);
call link_item_to_category(25, 1);
call link_item_to_category(26, 1);
call link_item_to_category(27, 1);
call link_item_to_category(28, 1);
call link_item_to_category(29, 1);
call link_item_to_category(30, 1);
call link_item_to_category(31, 1);

-- IMDB Top 25 rated

INSERT INTO Item
Values(NULL, 'The Shawshank Redemptions', '1994', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Godfather', '1972', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Dark Knight', '2008', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Godfather: Part II', '1974', 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg', current_date()),
       (NULL, '12 Angry Men', '1957', 'https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Schindler List', '1993', 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Lord of the Rings: The Return of the King', '2003', 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Pulp Fiction', '1994', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Lord of the Rings: The Fellowship of the Ring', '2001', 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Good, the Bad and the Ugly', '1996', 'https://m.media-amazon.com/images/M/MV5BNjJlYmNkZGItM2NhYy00MjlmLTk5NmQtNjg1NmM2ODU4OTMwXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Forrest Gump', '1994', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Fight Club', '1999', 'https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Inception', '2010', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Lord of the Rings: The Two Towers', '2002', 'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Star Wars: Episode V - The Empire Strikes Back', '1980', 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Matrix', '1999', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Goodfellas', '1990', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'One Flew Over the Cuckoos Nest', '1975', 'https://m.media-amazon.com/images/M/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Se7en', '1995', 'https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Seven Samurai', '1954', 'https://m.media-amazon.com/images/M/MV5BNWQ3OTM4ZGItMWEwZi00MjI5LWI3YzgtNTYwNWRkNmIzMGI5XkEyXkFqcGdeQXVyNDY2MTk1ODk@._V1_UY67_CR1,0,45,67_AL_.jpg', current_date()),
       (NULL, 'It is a Wonderful Life', '1946', 'https://m.media-amazon.com/images/M/MV5BZjc4NDZhZWMtNGEzYS00ZWU2LThlM2ItNTA0YzQ0OTExMTE2XkEyXkFqcGdeQXVyNjUwMzI2NzU@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'The Silence of the Lambs', '1991', 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'City of God', '2002', 'https://m.media-amazon.com/images/M/MV5BOTMwYjc5ZmItYTFjZC00ZGQ3LTlkNTMtMjZiNTZlMWQzNzI5XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Saving Private Ryan', '1998', 'https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_UY67_CR0,0,45,67_AL_.jpg', current_date()),
       (NULL, 'Life is Beautiful', '1997', 'https://m.media-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX45_CR0,0,45,67_AL_.jpg', current_date()); -- 56

call link_item_to_category(32, 2);
call link_item_to_category(33, 2);
call link_item_to_category(34, 2);
call link_item_to_category(35, 2);
call link_item_to_category(36, 2);
call link_item_to_category(37, 2);
call link_item_to_category(38, 2);
call link_item_to_category(39, 2);
call link_item_to_category(40, 2);
call link_item_to_category(41, 2);
call link_item_to_category(42, 2);
call link_item_to_category(43, 2);
call link_item_to_category(44, 2);
call link_item_to_category(45, 2);
call link_item_to_category(46, 2);
call link_item_to_category(47, 2);
call link_item_to_category(48, 2);
call link_item_to_category(49, 2);
call link_item_to_category(50, 2);
call link_item_to_category(51, 2);
call link_item_to_category(52, 2);
call link_item_to_category(53, 2);
call link_item_to_category(54, 2);
call link_item_to_category(55, 2);
call link_item_to_category(56, 2);

INSERT INTO Concept
VALUES (NULL, 'Absorbing', CURRENT_DATE()),
       (NULL, 'Ambitious', CURRENT_DATE()),
       (NULL, 'Humorous', CURRENT_DATE()),
       (NULL, 'Compelling', CURRENT_DATE()),
       (NULL, 'Gripping', CURRENT_DATE()),
       (NULL, 'Mysterious', CURRENT_DATE()),
       (NULL, 'Surprising', CURRENT_DATE()),
       (NULL, 'Tragic', CURRENT_DATE()),
       (NULL, 'Interesting', CURRENT_DATE()),
       (NULL, 'Romantic', CURRENT_DATE()),
       (NULL, 'Inventive', CURRENT_DATE()),
       (NULL, 'Powerful', CURRENT_DATE()),
       (NULL, 'Historical', CURRENT_DATE()),
       (NULL, 'Plot-driven', CURRENT_DATE()),
       (NULL, 'Realistic', CURRENT_DATE()),
       (NULL, 'Meaningful', CURRENT_DATE()),
       (NULL, 'Moving', CURRENT_DATE()),
       (NULL, 'Emotional', CURRENT_DATE()),
       (NULL, 'Coherent', CURRENT_DATE()),
       (NULL, 'Timeless', CURRENT_DATE()),
       (NULL, 'Unique', CURRENT_DATE()),
       (NULL, 'Evocative', CURRENT_DATE()),
       (NULL, 'Bold', CURRENT_DATE()),
       (NULL, 'Ironic', CURRENT_DATE()),
       (NULL, 'Daring', CURRENT_DATE());

call link_concept_to_category(26,2);
call link_concept_to_category(27,2);
call link_concept_to_category(28,2);
call link_concept_to_category(29,2);
call link_concept_to_category(20,2);
call link_concept_to_category(31,2);
call link_concept_to_category(32,2);
call link_concept_to_category(33,2);
call link_concept_to_category(34,2);
call link_concept_to_category(35,2);
call link_concept_to_category(36,2);
call link_concept_to_category(37,2);
call link_concept_to_category(38,2);
call link_concept_to_category(39,2);
call link_concept_to_category(40,2);
call link_concept_to_category(41,2);
call link_concept_to_category(42,2);
call link_concept_to_category(43,2);
call link_concept_to_category(44,2);
call link_concept_to_category(45,2);
call link_concept_to_category(46,2);
call link_concept_to_category(47,2);
call link_concept_to_category(48,2);
call link_concept_to_category(49,2);
call link_concept_to_category(50,2);


-- https://thegreatestbooks.org/

INSERT INTO Item
Values(NULL, 'In Search of Lost Time', 'Marcel Proust', 'https://d3i5mgdwi2ze58.cloudfront.net/7hqv6ddaqv363p4hadx6lymotow1', current_date()),
       (NULL, 'Ulysses', 'James Joyce', 'https://d3i5mgdwi2ze58.cloudfront.net/f7nkbyqfsnrrlct3hs01jkrz2vdi', current_date()),
       (NULL, 'Don Quixote', 'Miguel de Cervantes', 'https://d3i5mgdwi2ze58.cloudfront.net/wa12vserm1jdqg99atu41wflyx2c', current_date()),
       (NULL, 'One Hundred Years of Solitude', 'Gabriel Marquez', 'https://d3i5mgdwi2ze58.cloudfront.net/j7koelfcv0va5zky4x1ccmpsgcsb', current_date()),
       (NULL, 'The Great Gatsby', 'F. Scott Fitzgerald', 'https://d3i5mgdwi2ze58.cloudfront.net/m8sdet02cc7mdl8l6jow8cpl7co2', current_date()),
       (NULL, 'Moby Dick', 'Herman Melville', 'https://d3i5mgdwi2ze58.cloudfront.net/epke1jolmtb858vv9ctbtxpa8yi6', current_date()),
       (NULL, 'War and Peace', 'Leo Tolstoy', 'https://d3i5mgdwi2ze58.cloudfront.net/hwi2qqngyicqz7s7ps4x4k1ei14k', current_date()),
       (NULL, 'Hamlet', 'William Shakespeare', 'https://d3i5mgdwi2ze58.cloudfront.net/c3vamn31mxzu7dr9l1b6da1g38oi', current_date()),
       (NULL, 'The Odyssey', 'Homer', 'https://d3i5mgdwi2ze58.cloudfront.net/jyx2n4emuiwjjfu682ylkh10xyoj', current_date()),
       (NULL, 'Madame Bovary', 'Gustave Flaubert', 'https://d3i5mgdwi2ze58.cloudfront.net/rtw3xjyjbcouewfrbpz5lcx5e6yf', current_date()),
       (NULL, 'The Divine Comedy', 'Dante Alighieri', 'https://d3i5mgdwi2ze58.cloudfront.net/r3pnyg732gdvkmh8pik9p0b5ct6y', current_date()),
       (NULL, 'Lolita', 'Vladimir Nabokov', 'https://d3i5mgdwi2ze58.cloudfront.net/cuqzoi0t52xnb7cjhdzrfuc7rjj4', current_date()),
       (NULL, 'The Brothers Karamazov', 'Fyodor Dostoyevsky', 'https://d3i5mgdwi2ze58.cloudfront.net/ctt318djdthx536i3glgdw270dyq', current_date()),
       (NULL, 'Crime and Punishment', 'Fyodor Dostoyevsky', 'https://d3i5mgdwi2ze58.cloudfront.net/t25h3cf21f4l535cyl9tw5l4kfpb', current_date()),
       (NULL, 'Wuthering Heights', 'Emily Bronte', 'https://d3i5mgdwi2ze58.cloudfront.net/43ma2b4rlzqbh8181hj7dnpuz5at', current_date()),
       (NULL, 'The Catcher in the Rye', 'J. D. Salinger', 'https://d3i5mgdwi2ze58.cloudfront.net/arrd4a0qpe7i6ff6jtfmtllqcl6v', current_date()),
       (NULL, 'Pride an Prejudice', 'Jane Austen', 'https://d3i5mgdwi2ze58.cloudfront.net/k4thdrwtugqhuvacwpowkkuivis8', current_date()),
       (NULL, 'The Adventures of Huckleberry Finn', 'Mark Twain', 'https://d3i5mgdwi2ze58.cloudfront.net/phz3vc780qvnafu8phrzjyptq75a', current_date()),
       (NULL, 'Anna Karenina', 'Leo Tolstoy', 'https://d3i5mgdwi2ze58.cloudfront.net/kv7bohlfznregsg7wuttncytwvvv', current_date()),
       (NULL, 'Alice\'s Adventures in Wonderland', 'Lewis Carroll', 'https://d3i5mgdwi2ze58.cloudfront.net/f8uct7xgd8cz5cw1dsz54zc6swlc', current_date()),
       (NULL, 'The Iliad', 'Homer', 'https://d3i5mgdwi2ze58.cloudfront.net/kudnd6hjgwhd190ozepfx6g8js7g', current_date()),
       (NULL, 'To the Lighthouse', 'Virginia Woolf', 'https://d3i5mgdwi2ze58.cloudfront.net/tpb4tu06jka0u1gzoz0ern7ef614', current_date()),
       (NULL, 'Catch-22', 'Joseph Heller', 'https://d3i5mgdwi2ze58.cloudfront.net/nt89wltdl9jnhx3jwqrq7fdsn5xx', current_date()),
       (NULL, 'Heart of Darkness', 'Joseph Conrad', 'https://d3i5mgdwi2ze58.cloudfront.net/tyxilwq93riaj4702yj9ntkf6o8g', current_date()),
       (NULL, 'The Sound and the Fury', 'William Faulkner', 'https://d3i5mgdwi2ze58.cloudfront.net/zqqerjm8ewv5z75v1cnk9wmno0rp', current_date());

call link_item_to_category(57, 3);
call link_item_to_category(58, 3);
call link_item_to_category(59, 3);
call link_item_to_category(60, 3);
call link_item_to_category(61, 3);
call link_item_to_category(62, 3);
call link_item_to_category(63, 3);
call link_item_to_category(64, 3);
call link_item_to_category(65, 3);
call link_item_to_category(66, 3);
call link_item_to_category(67, 3);
call link_item_to_category(68, 3);
call link_item_to_category(69, 3);
call link_item_to_category(70, 3);
call link_item_to_category(71, 3);
call link_item_to_category(72, 3);
call link_item_to_category(73, 3);
call link_item_to_category(74, 3);
call link_item_to_category(75, 3);
call link_item_to_category(76, 3);
call link_item_to_category(77, 3);
call link_item_to_category(78, 3);
call link_item_to_category(79, 3);
call link_item_to_category(80, 3);
call link_item_to_category(81, 3);

INSERT INTO Concept
VALUES (NULL, 'Absorbing', CURRENT_DATE()),
       (NULL, 'Ambitious', CURRENT_DATE()),
       (NULL, 'Humorous', CURRENT_DATE()),
       (NULL, 'Compelling', CURRENT_DATE()),
       (NULL, 'Gripping', CURRENT_DATE()),
       (NULL, 'Mysterious', CURRENT_DATE()),
       (NULL, 'Surprising', CURRENT_DATE()),
       (NULL, 'Tragic', CURRENT_DATE()),
       (NULL, 'Interesting', CURRENT_DATE()),
       (NULL, 'Romantic', CURRENT_DATE()),
       (NULL, 'Inventive', CURRENT_DATE()),
       (NULL, 'Powerful', CURRENT_DATE()),
       (NULL, 'Historical', CURRENT_DATE()),
       (NULL, 'Plot-driven', CURRENT_DATE()),
       (NULL, 'Realistic', CURRENT_DATE()),
       (NULL, 'Meaningful', CURRENT_DATE()),
       (NULL, 'Moving', CURRENT_DATE()),
       (NULL, 'Emotional', CURRENT_DATE()),
       (NULL, 'Coherent', CURRENT_DATE()),
       (NULL, 'Timeless', CURRENT_DATE()),
       (NULL, 'Unique', CURRENT_DATE()),
       (NULL, 'Evocative', CURRENT_DATE()),
       (NULL, 'Bold', CURRENT_DATE()),
       (NULL, 'Ironic', CURRENT_DATE()),
       (NULL, 'Daring', CURRENT_DATE());

call link_concept_to_category(51,3);
call link_concept_to_category(52,3);
call link_concept_to_category(53,3);
call link_concept_to_category(54,3);
call link_concept_to_category(55,3);
call link_concept_to_category(56,3);
call link_concept_to_category(57,3);
call link_concept_to_category(58,3);
call link_concept_to_category(59,3);
call link_concept_to_category(60,3);
call link_concept_to_category(61,3);
call link_concept_to_category(62,3);
call link_concept_to_category(63,3);
call link_concept_to_category(64,3);
call link_concept_to_category(65,3);
call link_concept_to_category(66,3);
call link_concept_to_category(67,3);
call link_concept_to_category(68,3);
call link_concept_to_category(69,3);
call link_concept_to_category(70,3);
call link_concept_to_category(71,3);
call link_concept_to_category(72,3);
call link_concept_to_category(73,3);
call link_concept_to_category(74,3);
call link_concept_to_category(75,3);

-- https://www.ranker.com/list/best-paintings-all-time/ranker-art

INSERT INTO Item
VALUES (NULL, 'The Starry Night', 'vincent van Gogh', 'https://imgix.ranker.com/user_node_img/112/2223028/original/the-starry-night-photo-u4?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
        (NULL, 'The Creation of Adam', 'Michelangelo', 'https://imgix.ranker.com/user_node_img/110/2185637/original/the-creation-of-adam-photo-u4?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Girl with a Pearl Earring', 'Johannes Vermeer', 'https://imgix.ranker.com/user_node_img/188/3753746/original/girl-with-a-pearl-earring-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Last Supper', 'Leonardo da Vinci', 'https://imgix.ranker.com/user_node_img/125/2486197/original/the-last-supper-photo-u5?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Ninth Wave', 'Ivan Aivazovsky', 'https://imgix.ranker.com/user_node_img/2231/44616753/original/the-ninth-wave-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Japanese Footbridge and the Water Lily Pool, Giverny', 'Claude Monet', 'https://imgix.ranker.com/user_node_img/932/18624683/original/the-japanese-footbridge-and-the-water-lily-pool-giverny-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Birth of Venus', 'Sandro Botticelli', 'https://imgix.ranker.com/user_node_img/109/2179156/original/the-birth-of-venus-photo-u4?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Lady of Shalott', 'John William Waterhouse', 'https://imgix.ranker.com/user_node_img/475/9494074/original/the-lady-of-shalott-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Night Watch', 'Rembrandt', 'https://imgix.ranker.com/user_node_img/136/2717293/original/night-watch-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Astronomer', 'Johannes Vermeer', 'https://imgix.ranker.com/user_node_img/189/3776657/original/the-astronomer-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Dance at Le Moulin de la Galette', 'Pierre-Auguste Renoir', 'https://imgix.ranker.com/user_node_img/27/536908/original/bal-au-moulin-de-la-galette-montmartre-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Cafe Terrace at Night', 'Vincent van Gogh', 'https://imgix.ranker.com/user_node_img/33/655553/original/cafe-terrace-at-night-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Mona Lisa', 'Leonardo da Vinci', 'https://imgix.ranker.com/user_node_img/81/1607538/original/mona-lisa-photo-u9?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Nighthawks', 'Edward Hopper', 'https://imgix.ranker.com/user_node_img/84/1679282/original/nighthawks-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Water Lilies', 'Claude Monet', 'https://imgix.ranker.com/user_node_img/119/2364003/original/water-lillies-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Persistence of Memory', 'Salvador Dali', 'https://imgix.ranker.com/user_node_img/111/2213342/original/the-persistence-of-memory-photo-u4?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Flaming June', 'Frederic Leighton', 'https://imgix.ranker.com/user_node_img/50/998100/original/flaming-june-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Wanderer above the Sea of Fog', 'Caspar David Friedrich', 'https://imgix.ranker.com/user_node_img/118/2358705/original/wanderer-above-the-sea-of-fog-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Impression, Sunrise', 'Claude Monet', 'https://imgix.ranker.com/user_node_img/61/1215724/original/impression-sunrise-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Luncheon of the Boating Party', 'Pierre-Auguste Renoir', 'https://imgix.ranker.com/user_node_img/75/1487553/original/luncheon-of-the-boating-party-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Lady Agnew of Lochnaw', 'John Singer Sargent', 'https://imgix.ranker.com/user_node_img/567/11337556/original/lady-agnew-of-lochnaw-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Las Meninas', 'Diego Velazquez', 'https://imgix.ranker.com/user_node_img/71/1415789/original/las-meninas-photo-u3?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Liberty Leading the People', 'Eugene Delacroix', 'https://imgix.ranker.com/user_node_img/73/1444497/original/july-28-liberty-leading-the-people-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'The Great Wave off Kanagawa', 'Hokusai', 'https://imgix.ranker.com/user_node_img/1698/33952630/original/the-great-wave-off-kanagawa-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date()),
       (NULL, 'Napoleon Crossing the Alps', 'Jacques-Louis David', 'https://imgix.ranker.com/user_node_img/1651/33012074/original/napoleon-crossing-the-alps-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=650', current_date());

call link_item_to_category(82, 4);
call link_item_to_category(83, 4);
call link_item_to_category(84, 4);
call link_item_to_category(85, 4);
call link_item_to_category(86, 4);
call link_item_to_category(87, 4);
call link_item_to_category(88, 4);
call link_item_to_category(89, 4);
call link_item_to_category(90, 4);
call link_item_to_category(91, 4);
call link_item_to_category(92, 4);
call link_item_to_category(93, 4);
call link_item_to_category(94, 4);
call link_item_to_category(95, 4);
call link_item_to_category(96, 4);
call link_item_to_category(97, 4);
call link_item_to_category(98, 4);
call link_item_to_category(99, 4);
call link_item_to_category(100, 4);
call link_item_to_category(101, 4);
call link_item_to_category(102, 4);
call link_item_to_category(103, 4);
call link_item_to_category(104, 4);
call link_item_to_category(105, 4);
call link_item_to_category(106, 4);

INSERT INTO Concept
VALUES (NULL, 'Absorbing', CURRENT_DATE()),
       (NULL, 'Ambitious', CURRENT_DATE()),
       (NULL, 'Humorous', CURRENT_DATE()),
       (NULL, 'Compelling', CURRENT_DATE()),
       (NULL, 'Gripping', CURRENT_DATE()),
       (NULL, 'Mysterious', CURRENT_DATE()),
       (NULL, 'Surprising', CURRENT_DATE()),
       (NULL, 'Tragic', CURRENT_DATE()),
       (NULL, 'Interesting', CURRENT_DATE()),
       (NULL, 'Romantic', CURRENT_DATE()),
       (NULL, 'Inventive', CURRENT_DATE()),
       (NULL, 'Powerful', CURRENT_DATE()),
       (NULL, 'Historical', CURRENT_DATE()),
       (NULL, 'Plot-driven', CURRENT_DATE()),
       (NULL, 'Realistic', CURRENT_DATE()),
       (NULL, 'Meaningful', CURRENT_DATE()),
       (NULL, 'Moving', CURRENT_DATE()),
       (NULL, 'Emotional', CURRENT_DATE()),
       (NULL, 'Coherent', CURRENT_DATE()),
       (NULL, 'Timeless', CURRENT_DATE()),
       (NULL, 'Unique', CURRENT_DATE()),
       (NULL, 'Evocative', CURRENT_DATE()),
       (NULL, 'Bold', CURRENT_DATE()),
       (NULL, 'Ironic', CURRENT_DATE()),
       (NULL, 'Daring', CURRENT_DATE());

INSERT INTO Concept
VALUES (NULL, 'Absorbing', CURRENT_DATE()),
       (NULL, 'Ambitious', CURRENT_DATE()),
       (NULL, 'Humorous', CURRENT_DATE()),
       (NULL, 'Compelling', CURRENT_DATE()),
       (NULL, 'Gripping', CURRENT_DATE()),
       (NULL, 'Mysterious', CURRENT_DATE()),
       (NULL, 'Surprising', CURRENT_DATE()),
       (NULL, 'Tragic', CURRENT_DATE()),
       (NULL, 'Interesting', CURRENT_DATE()),
       (NULL, 'Romantic', CURRENT_DATE()),
       (NULL, 'Inventive', CURRENT_DATE()),
       (NULL, 'Powerful', CURRENT_DATE()),
       (NULL, 'Historical', CURRENT_DATE()),
       (NULL, 'Refined', CURRENT_DATE()),
       (NULL, 'Realistic', CURRENT_DATE()),
       (NULL, 'Meaningful', CURRENT_DATE()),
       (NULL, 'Moving', CURRENT_DATE()),
       (NULL, 'Emotional', CURRENT_DATE()),
       (NULL, 'Coherent', CURRENT_DATE()),
       (NULL, 'Timeless', CURRENT_DATE()),
       (NULL, 'Unique', CURRENT_DATE()),
       (NULL, 'Evocative', CURRENT_DATE()),
       (NULL, 'Bold', CURRENT_DATE()),
       (NULL, 'Ironic', CURRENT_DATE()),
       (NULL, 'Daring', CURRENT_DATE());

call link_concept_to_category(76,4);
call link_concept_to_category(77,4);
call link_concept_to_category(78,4);
call link_concept_to_category(79,4);
call link_concept_to_category(80,4);
call link_concept_to_category(81,4);
call link_concept_to_category(82,4);
call link_concept_to_category(83,4);
call link_concept_to_category(84,4);
call link_concept_to_category(85,4);
call link_concept_to_category(86,4);
call link_concept_to_category(87,4);
call link_concept_to_category(88,4);
call link_concept_to_category(89,4);
call link_concept_to_category(90,4);
call link_concept_to_category(91,4);
call link_concept_to_category(92,4);
call link_concept_to_category(93,4);
call link_concept_to_category(94,4);
call link_concept_to_category(95,4);
call link_concept_to_category(96,4);
call link_concept_to_category(97,4);
call link_concept_to_category(98,4);
call link_concept_to_category(99,4);
call link_concept_to_category(100,4);
