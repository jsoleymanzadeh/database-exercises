USE codeup_test_db;
SELECT 'SELECT * FROM albums WHERE release_date > 1991;' AS 'albums released after 1991';
DELETE
FROM albums
WHERE release_date > 1991;
SELECT *
FROM albums
WHERE release_date > 1991;
SELECT 'SELECT * FROM albums WHERE genre = ''disco'';' AS 'albums with the genre ''disco''';
DELETE
FROM albums
WHERE genre = 'disco';
SELECT *
FROM albums
WHERE genre = 'disco';
SELECT 'SELECT * FROM albums WHERE artist = ''Whitney Houston'';' AS 'albums by ''Whitney Houston''';
DELETE
FROM albums
WHERE artist = 'Whitney Houston';
SELECT *
FROM albums
WHERE artist = 'Whitney Houston';