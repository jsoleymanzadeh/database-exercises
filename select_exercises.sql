USE codeup_test_db;
SELECT 'SELECT name FROM albums WHERE artist = ''Pink Floyd'';' AS 'all albums by Pink Floyd';
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';
SELECT 'SELECT release_date FROM albums WHERE name = ''Sgt. Pepper''''s Lonely Hearts Club Band'';' AS 'year Sgt. Pepper''s Lonely Hearts Club Band was released';
SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
SELECT 'SELECT genre FROM albums WHERE name = ''Nevermind'';' AS 'genre for Nevermind';
SELECT genre
FROM albums
WHERE name = 'Nevermind';
SELECT 'SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;' AS 'albums released in the 1990s';
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
SELECT 'SELECT name FROM albums WHERE sales < 20;' AS 'albums with less than 20 million certified sales';
SELECT name
FROM albums
WHERE sales < 20;
SELECT 'SELECT name FROM albums WHERE genre = ''Rock'';' AS 'albums with a genre of "Rock"';
SELECT name
FROM albums
WHERE genre = 'Rock';