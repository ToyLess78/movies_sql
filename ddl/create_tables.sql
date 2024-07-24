CREATE TABLE files (
                       id SERIAL PRIMARY KEY,
                       file_name VARCHAR(255) NOT NULL,
                       mime_type VARCHAR(50) NOT NULL,
                       key VARCHAR(255) NOT NULL,
                       url VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       username VARCHAR(50) NOT NULL,
                       first_name VARCHAR(50) NOT NULL,
                       last_name VARCHAR(50) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       avatar_id INTEGER REFERENCES files(id),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE persons (
                         id SERIAL PRIMARY KEY,
                         first_name VARCHAR(50) NOT NULL,
                         last_name VARCHAR(50) NOT NULL,
                         biography TEXT,
                         date_of_birth DATE,
                         gender VARCHAR(10),
                         country_id INTEGER,
                         primary_photo_id INTEGER REFERENCES files(id),
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE movies (
                        id SERIAL PRIMARY KEY,
                        title VARCHAR(255) NOT NULL,
                        description TEXT,
                        budget INTEGER,
                        release_date DATE,
                        duration INTEGER,
                        director_id INTEGER REFERENCES persons(id),
                        country_id INTEGER,
                        poster_id INTEGER REFERENCES files(id),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE genres (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(50) NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE characters (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(255) NOT NULL,
                            description TEXT,
                            role VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
                            movie_id INTEGER REFERENCES movies(id),
                            person_id INTEGER REFERENCES persons(id),
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE movie_genres (
                              movie_id INTEGER REFERENCES movies(id),
                              genre_id INTEGER REFERENCES genres(id),
                              PRIMARY KEY (movie_id, genre_id)
);

CREATE TABLE favorite_movies (
                                 user_id INTEGER REFERENCES users(id),
                                 movie_id INTEGER REFERENCES movies(id),
                                 PRIMARY KEY (user_id, movie_id)
);
