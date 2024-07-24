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
            'last_name', p.last_name,
            'photo', json_build_object(
                    'id', pf.id,
                    'file_name', pf.file_name,
                    'mime_type', pf.mime_type,
                    'key', pf.key,
                    'url', pf.url
                )
        ) AS director,
    json_agg(
            json_build_object(
                    'id', a.id,
                    'first_name', a.first_name,
                    'last_name', a.last_name,
                    'photo', json_build_object(
                            'id', af.id,
                            'file_name', af.file_name,
                            'mime_type', af.mime_type,
                            'key', af.key,
                            'url', af.url
                        )
                )
        ) AS actors,
    json_agg(
            json_build_object(
                    'id', g.id,
                    'name', g.name
                )
        ) AS genres
FROM
    movies m
        JOIN files f ON m.poster_id = f.id
        JOIN persons p ON m.director_id = p.id
        LEFT JOIN files pf ON p.primary_photo_id = pf.id
        LEFT JOIN characters c ON m.id = c.movie_id
        LEFT JOIN persons a ON c.person_id = a.id
        LEFT JOIN files af ON a.primary_photo_id = af.id
        LEFT JOIN movie_genres mg ON m.id = mg.movie_id
        LEFT JOIN genres g ON mg.genre_id = g.id
WHERE
        m.id = 1
GROUP BY
    m.id, f.id, p.id, pf.id;
