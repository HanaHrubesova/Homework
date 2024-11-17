WITH
    help AS (
        SELECT
            v.country,
            v.site,
            LAG(v.visit) OVER (
                PARTITION BY
                    v.site,
                    v.country
                ORDER BY
                    v.qt
            ) AS prev_qt, --previous quater
            v.visit AS next_qt,
            v.visit-LAG(v.visit) OVER (
                PARTITION BY
                    v.site,
                    v.country
            ) AS QoQ, --calculatioon of QoQ
            v.qt,
            s.category,
            c.name AS country_name
        FROM
            (
                SELECT
                    site,
                    country,
                    DATE_PART('quarter', MAKE_DATE(YEAR, MONTH, 1)) AS qt, --To select month to quater
                    SUM(visits) AS visit
                FROM
                    public.site_monthly_visits
                GROUP BY
                    YEAR,
                    qt,
                    site,
                    country,
                    site
                ORDER BY
                    site,
                    country,
                    qt
            ) v
            JOIN public.site_category_source s ON v.site=s.site --Full join to keep websites that do not have any visits data in the final output.
            LEFT JOIN public.country c ON v.country=c.countrycode --Left join just for the cuntry that has data
    )
SELECT
    country,
    country_name,
    site,
    category,
    prev_qt,
    next_qt,
    QoQ
FROM
    (
        SELECT
            country,
            country_name,
            site,
            category,
            prev_qt,
            next_qt,
            QoQ,
            RANK() OVER (
                PARTITION BY
                    country
                ORDER BY
                    QoQ DESC
            ) AS r --Ranking to be able to select top 10
        FROM
            help
        WHERE
            qoq>0 --Selecting the positive QoQ positive change
    )
WHERE
    r<=10 -- Selecting just top10