TRUNCATE TABLE TrackCollections, Collections, Tracks, AlbumArtists, Albums, ArtistGenres, Artists, Genres RESTART IDENTITY CASCADE;

INSERT INTO Genres (name) VALUES ('Pop'), ('Rock'), ('Hip-Hop'), ('Rap');

INSERT INTO Artists (name) VALUES ('Eminem'), ('Imagine Dragons'), ('Баста'), ('Zivert');

INSERT INTO ArtistGenres (artist_id, genre_id) VALUES (1, 3), (1, 4),  (2, 1), (2, 2), (3, 1), (3, 3), (3, 4), (4, 1);

INSERT INTO Albums (album_name, release_year) VALUES ('Kamikaze', 2018), ('The death of Slim Shady', 2024), ('Evolve', 2017), ('Loom', 2024), ('Баста 1', 2006), ('Баста 4', 2013), ('Сияй', 2018), ('В мире весёлых', 2023), ('Vinil 1', 2019);

INSERT INTO AlbumArtists (artist_id, album_id) VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (4, 7), (4, 8);

INSERT INTO Collections(collection_name, release_year) VALUES ('Хиты 2024', 2024), ('Рок хиты', 2018), ('В дорогу', 2016), ('Лучшее за всё время', 2026);

INSERT INTO Tracks(title, duration, album_id) VALUES ('Good guy', 2 * 60 + 22, 1), ('Lucky You', 4 * 60 + 4, 1), ('Like My Shit', 3 * 60 + 47, 2), ('Renaissance', 1 * 60 + 38, 2), ('Evil', 3 * 60 + 50, 2), ('Believer', 3 * 60 + 24, 3), ('Rise Up', 3 * 60 + 52, 3), ('Wake Up', 2 * 60 + 47, 4), ('Раз и навсегда', 3 * 60 + 36, 5), ('Мама', 4 * 60 + 36, 6), ('Сияй', 3 * 60 + 24, 7), ('Место', 3 * 60 + 36, 8), ('Шарик', 3 * 60 + 2, 9), ('Fly', 3 * 60 + 13, 9);

INSERT INTO TrackCollections(collection_id, track_id) VALUES (1, 12), (1, 11), (1, 10), (2, 5), (2, 6), (2, 7), (2, 8), (3, 1), (3, 11),(4, 1), (4, 4), (4, 6), (4, 8);