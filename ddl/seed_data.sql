INSERT INTO files (file_name, mime_type, key, url) VALUES
                                                       ('avatar.png', 'image/png', 'avatars/avatar.png', 'https://example.com/avatars/avatar.png'),
                                                       ('poster.png', 'image/png', 'posters/poster.png', 'https://example.com/posters/poster.png');

INSERT INTO persons (first_name, last_name, biography, date_of_birth, gender, country_id, primary_photo_id)
VALUES ('Christopher', 'Nolan', 'British-American film director', '1970-07-30', 'male', 1, 1);

INSERT INTO users (username, first_name, last_name, email, password, avatar_id)
VALUES ('john_doe', 'John', 'Doe', 'john@example.com', 'password123', 1);

INSERT INTO movies (title, description, budget, release_date, duration, director_id, country_id, poster_id)
VALUES ('Inception', 'A mind-bending thriller', 160000000, '2010-07-16', 148, 1, 1, 2);

INSERT INTO favorite_movies (user_id, movie_id)
VALUES (1, 1);
