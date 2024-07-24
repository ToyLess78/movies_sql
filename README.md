# Movies App

This project is a simplified database for a movie application. It includes the database structure, ER diagram, and SQL queries.

## ER Diagram

```mermaid
erDiagram
    USERS {
        int id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        int avatar_id
        timestamp created_at
        timestamp updated_at
    }
    FILES {
        int id PK
        varchar file_name
        varchar mime_type
        varchar key
        varchar url
        timestamp created_at
        timestamp updated_at
    }
    PERSONS {
        int id PK
        varchar first_name
        varchar last_name
        text biography
        date date_of_birth
        varchar gender
        int country_id
        int primary_photo_id
        timestamp created_at
        timestamp updated_at
    }
    MOVIES {
        int id PK
        varchar title
        text description
        int budget
        date release_date
        int duration
        int director_id
        int country_id
        int poster_id
        timestamp created_at
        timestamp updated_at
    }
    GENRES {
        int id PK
        varchar name
        timestamp created_at
        timestamp updated_at
    }
    CHARACTERS {
        int id PK
        varchar name
        text description
        varchar role
        int movie_id
        int person_id
        timestamp created_at
        timestamp updated_at
    }
    MOVIE_GENRES {
        int movie_id PK
        int genre_id PK
    }
    FAVORITE_MOVIES {
        int user_id PK
        int movie_id PK
    }

    USERS ||--o{ FILES : "has"
    USERS ||--o{ FAVORITE_MOVIES : "has"
    FILES ||--o{ PERSONS : "has"
    FILES ||--o{ MOVIES : "has"
    PERSONS ||--o{ MOVIES : "directs"
    MOVIES ||--o{ CHARACTERS : "has"
    MOVIES ||--o{ MOVIE_GENRES : "has"
    MOVIES ||--o{ FAVORITE_MOVIES : "is in"
    GENRES ||--o{ MOVIE_GENRES : "has"
    PERSONS ||--o{ CHARACTERS : "plays"
```

## Project structure

movies_app_sql/  
├── README.md  
├── queries/  
│   ├── 1_select_actors_with_total_movies_budget.sql  
│   ├── 2_select_movies_released_in_last_5_years_with_actors_count.sql  
│   ├── 3_select_users_with_favorite_movies.sql  
│   ├── 4_select_directors_with_average_movie_budget.sql  
│   ├── 5_select_movies_by_criteria.sql  
│   ├── 6_select_movie_details_by_id.sql  
├── ddl/  
│ ├── create_tables.sql  
│ ├── seed_data.sql  
├── package.json  
└── node_modules/  

## Setup

Install dependencies:
  ```sh
  npm install
  ```

### Executing SQL Scripts

1. Create the tables:
   ```sh
   psql -U postgres -c "CREATE DATABASE movies_db;"
     ```
2. Fill the database with test data:
     ```sh
     psql -U postgres -d movies_db -f ddl/seed_data.ddl
     ```


## Using
To run SQL queries, use:
```sh
psql -U postgres -d movies_db -f queries/1_select_actors_with_total_movies_budget.ddl

``` 

... and other