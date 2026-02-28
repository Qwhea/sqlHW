
SELECT * FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

SELECT title FROM tracks
WHERE duration >= (3 * 60 + 30);

SELECT collection_name FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name AS n FROM Artists
WHERE name NOT LIKE '% %';

SELECT title FROM TRACKS
WHERE string_to_array(lower(title), ' ') && ARRAY ['my', 'мой'];

SELECT 
    g.name,
    COUNT(*) AS artist_count
FROM ArtistGenres ag
JOIN Genres g ON ag.genre_id = g.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

SELECT COUNT(*) FROM tracks
WHERE album_id = (SELECT album_id FROM Albums WHERE release_year BETWEEN 2019 AND 2020);

SELECT album_id, AVG(duration) FROM Tracks
GROUP BY album_id 
ORDER BY album_id;

SELECT name FROM Artists
WHERE artist_id NOT IN (
    SELECT DISTINCT artist_id 
    FROM AlbumArtists aa
    JOIN Albums a ON aa.album_id  = a.album_id 
    WHERE a.release_year = 2020
);

SELECT DISTINCT c.collection_name, c.release_year
FROM Collections c
JOIN TrackCollections tc ON c.collection_id = tc.collection_id
WHERE tc.track_id IN (
    SELECT t.track_id
    FROM Tracks t
    JOIN Albums a ON t.album_id = a.album_id
    JOIN AlbumArtists aa ON a.album_id = aa.album_id
    JOIN Artists ar ON aa.artist_id = ar.artist_id
    WHERE ar.name = 'Баста'
)
ORDER BY c.release_year;

SELECT DISTINCT a.album_id 
FROM Albums a
JOIN AlbumArtists aa ON a.album_id  = aa.album_id 
WHERE aa.artist_id IN (
    SELECT artist_id
    FROM ArtistGenres
    GROUP BY artist_id
    HAVING COUNT(genre_id) > 1
)
ORDER BY a.album_id;

SELECT title
FROM tracks
WHERE track_id NOT IN(
    SELECT track_id 
    FROM TrackCollections
);

SELECT DISTINCT a.name 
FROM Artists a
JOIN AlbumArtists aa ON a.artist_id = aa.artist_id 
JOIN Albums al ON al.album_id   = aa.album_id 
JOIN Tracks t ON t.album_id = al.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Tracks);

SELECT a.album_name, COUNT(t.track_id) AS track_count
FROM Albums a
JOIN Tracks t ON t.album_id = a.album_id 
GROUP BY a.album_id, a.album_name 
HAVING COUNT(t.track_id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(track_id) AS track_count
        FROM Tracks
        GROUP BY album_id 
    ) AS album_counts
);
