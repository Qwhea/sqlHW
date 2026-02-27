CREATE TABLE Genres(
genre_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE)

CREATE TABLE Artists(
artist_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL
)

CREATE TABLE ArtistGenres(
artist_id INT REFERENCES Artists(artist_id) ON DELETE CASCADE,
genre_id INT REFERENCES Genres(genre_id) ON DELETE CASCADE,
PRIMARY KEY(artist_id, genre_id)
)

CREATE TABLE  Albums(
album_id SERIAL PRIMARY KEY,
album_name VARCHAR(100) NOT NULL,
release_year INT NOT NULL 
)

CREATE TABLE AlbumArtists(
artist_id INT REFERENCES Artists(artist_id) ON DELETE CASCADE,
album_id INT REFERENCES Albums(album_id) ON DELETE CASCADE,
PRIMARY KEY (artist_id, album_id)
)

CREATE TABLE Tracks(
track_id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
duration INT NOT NULL CHECK (duration > 0),
album_id INT REFERENCES Albums(album_id) ON DELETE CASCADE
)

CREATE TABLE Collections(
collection_id SERIAL PRIMARY KEY,
collection_name VARCHAR(100) NOT NULL,
release_year INT NOT NULL
)

CREATE TABLE TrackCollections(
collection_id INT REFERENCES Collections(collection_id) ON DELETE CASCADE,
track_id INT REFERENCES Tracks(track_id) ON DELETE CASCADE,
PRIMARY KEY (collection_id, track_id)
)
