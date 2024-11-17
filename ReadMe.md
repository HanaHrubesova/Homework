# QOQ ANALYSIS (SQL) - 40%
This part of the test will include data manipulation exercise.
within the drive folder shared with you you will find 2 relevant files:
_site_category_source.csv_
_site_monthly_visits.csv_
Details on the data can be found here:
[https://drive.google.com/drive/folders/1BD5SDHFtxZoaYGthxOfw2COPP9VruWSA?usp=sharing](https://drive.google.com/drive/folders/1BD5SDHFtxZoaYGthxOfw2COPP9VruWSA?usp=sharing)

In the instructions document you’ve received step by step details on how to upload the files
to PGadmin so you can query the files using SQL. Make sure you are all set up with the
PGAdmin DB and tables environment before you start. (This is not a necessary step, if you
have a different way to query using SQL that’s fine)

**Tasks:**

* Report - QoQ (Quarter over Quarter Analysis)
Use the tables you’ve created above.
- Top 10 sites per country by QoQ (Quarter over Quarter) positive change of visits.
QoQ positive change of visits means that the site's visits have increased between the last quarter and the current
quarter.
> The script is in the file : QOQ ANALYSIS.sql

> Output table is :

- Expected output schema:
Country, Country_Name, Site, Category, prev_q_visits, next_q_visits, qoq_visits_change
For the Country_Name field you will need to create a country to country name table from this dataset to get country name
and join it with the final output: [https://en.wikipedia.org/wiki/ISO_3166-1](https://en.wikipedia.org/wiki/ISO_3166-1)
- Note:
Query optimization is also a factor in this test, try and make the query as ‘elegant’ and light as possible. for example
by avoiding unnecessary JOINs. Make sure you keep websites that do not have any visits data in the final output.

* Visualization
Based on the table you’ve created above - create an interesting graph to present a point about the data, this could be
anything you think that could be interesting about the data, including time based trends, leading categories by country
or most failing sites per month.
You can use any visualization tool you prefer.
> Graph :

# VISITS ANALYSIS - PYTHON / SQL - 40%
This part of the test will include a data manipulation exercise.
Within the drive folder shared with you you will find the following file: _zoom.us_visits_05_20.csv_
You will need to locate the relevant visits and calculate the requested KPIs below.
Note:
The most convenient way to solve this question would be by using Python’s Pandas library, but if you are not feeling comfortable with it, you may also choose to analyse the data in another way or even combined (SQL/Python code).

**For the visits data in the csv file:**
- Find visits that include a pageview URL (an item in “pages” list column), that contains the specific string:_“upgradeSuccess”_.
  It doesn’t matter how many times it appears in a single visit, only if it was found at least once.
  For those visits calculate the following metrics and present in a single table/dataframe:
  - Number of visits per day and overall
  - Number of unique users per day and overall
  - Average number of (unique) pages viewed within the site between the start of a session to a successful upgrade, overall

> Script are in the : VISITS ANALYSIS.sql

- For all the visits in the file, calculate cohorts (groups) of visits durations (in seconds) of all of the users, meaning that for each group, you should present the number of users it contains as well as their share out of the total users.
You will need to convert the timeonsite from milliseconds to seconds
You can choose the cohorts yourself according to what you think fits the data, feel free to add a short explanation in a comment if there’s any particular reason you chose it.
  -An output for example is:

| Visit duration cohort	| 0-20 | 20-40 | 40-60 | 60-100	| 100-200 |	200+ |
|-----------------------|------|-------|-------|--------|---------|------|
| Number of users       | 1024 | 877   | 506   | 405	| 54	  | 76   |
| Share of users        | 35%  | 30%   | 17%   | 13%	| 2%	  | 3%   |

Create a visualization to display these results.
