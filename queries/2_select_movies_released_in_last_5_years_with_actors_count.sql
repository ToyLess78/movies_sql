SELECT
    m.id,
    m.title,
    COUNT(c.id) AS actors_count
FROM
    movies m
        JOIN
    characters c ON m.id = c.movie_id
WHERE
        m.release_date >= NOW() - INTERVAL '5 YEARS'
GROUP BY
    m.id;
