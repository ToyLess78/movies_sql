SELECT
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object(
            'id', f.id,
            'file_name', f.file_name,
            'mime_type', f.mime_type,
            'key', f.key,
            'url', f.url
        ) AS poster,
    json_build_object(
            'id', p.id,
            'first_name', p.first_name,
            'last_name', p.last_name
        ) AS director
FROM
    movies m
        JOIN files f ON m.poster_id = f.id
        JOIN persons p ON m.director_id = p.id
WHERE
        m.country_id = 1
  AND m.release_date >= '2022-01-01'
  AND m.duration > (2 * 60 + 15)
  AND EXISTS (
    SELECT 1
    FROM movie_genres mg
             JOIN genres g ON mg.genre_id = g.id
    WHERE mg.movie_id = m.id
      AND g.name IN ('Action', 'Drama')
);
