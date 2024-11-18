SELECT
    SUM(user_count) AS Number_of_visits_overall, --number of all visits
    AVG(user_count) AS Number_of_visits_per_day, -- number of visit per day
    SUM(distinct_user) AS Number_of_unique_users_per_day, -- number of unique user per day
    AVG(distinct_user) AS Number_of_unique_users_overall --number of uniq users overall
FROM
    (
        SELECT
            COUNT(*) AS user_count,
            COUNT(DISTINCT (users)) AS distinct_user,
            DATE
        FROM
            public.zoom_visit
        WHERE
            pages LIKE '%upgradeSuccess%' --selecting data that has "upgradeSuccess"
        GROUP BY
            DATE
    );

WITH
    help AS ( --finding in which position is the funnest part of array tj. the position of the URL in the whole array
        SELECT
            ARRAY_POSITION(array_pos, part_array) AS position_array,
            part_array,
            array_pos,
            date,
            users
        FROM
            ( -- unnesting array and still having array in othe column
                SELECT
                    UNNEST(array_pos) AS part_array,
                    array_pos,
                    date,
                    users
                FROM
                    ( --creating array from the url string to be able to unnest it in next step
                        SELECT
                            STRING_TO_ARRAY(
                                TRIM(
                                    BOTH '[]'
                                    FROM
                                        pages
                                ),
                                ', '
                            ) AS array_pos,
                            date,
                            users
                        FROM
                            ( --- select the visit with "upgradeSuccess” in it 
                                SELECT
                                    users,
                                    DATE,
                                    pages
                                FROM
                                    public.zoom_visit
                                WHERE
                                    pages LIKE '%upgradeSuccess%'
                            )
                    )
            )
    )
SELECT
    ROUND(SUM(position_array -1)::DECIMAL/COUNT(position_array), 1) AS avg_pages_before, -- average number of the pages viewed within the site between the start of a session to a successful upgrade
    COUNT(position_array) AS number_of_success, --number of the arrays
    SUM(position_array -1) AS pages_before -- number of the pages viewed within the site between the start of a session to a successful upgrade
FROM
    help
WHERE
    part_array LIKE '%upgradeSuccess%'