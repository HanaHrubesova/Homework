WITH
    time_blok AS (
        SELECT
            CASE
                WHEN timeonsite<=100000 THEN '0-100s'
                WHEN timeonsite>100000
                AND timeonsite<=200000 THEN '101-200s'
                WHEN timeonsite>200000
                AND timeonsite<=300000 THEN '201-300s'
                WHEN timeonsite>300000
                AND timeonsite<=400000 THEN '301-400s'
                WHEN timeonsite>400000
                AND timeonsite<=500000 THEN '401-500s'
                WHEN timeonsite>500000
                AND timeonsite<=600000 THEN '501-600s'
                WHEN timeonsite>600000
                AND timeonsite<=700000 THEN '601-700s'
                WHEN timeonsite>700000
                AND timeonsite<=800000 THEN '701-800s'
                WHEN timeonsite>800000
                AND timeonsite<=900000 THEN '801-900s'
                WHEN timeonsite>900000
                AND timeonsite<=1000000 THEN '901-1000s'
                WHEN timeonsite>1000000 THEN '1000s+'
            END AS blok, -- Selecting the timeblock 
            COUNT(users) AS user_count
        FROM
            public.zoom_visit
        GROUP BY
            blok
    ),
    total_user AS (
        SELECT
            COUNT(users) AS total_user
        FROM
            public.zoom_visit
    ) --Total number of users
SELECT
    blok,
    user_count,
    ROUND(((user_count::DECIMAL/total_user)*100), 2) -- The calculation of %  share of users  
FROM
    time_blok,
    total_user;