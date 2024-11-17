# QoQ ANALYSIS (SQL) - 40%
This part of the test will include data manipulation exercise.
within the drive folder shared with you you will find 2 relevant files:
_site_category_source.csv_ , 
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
> The script is in the file : [QOQ ANALYSIS.sql](https://github.com/HanaHrubesova/Homework/blob/main/QoQ%20Analysis.png)

> Output table is : [top10_visit_page.csv](https://github.com/HanaHrubesova/Homework/blob/main/to10_visit_page.csv)

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

> Graph - For visulaization I chose a webside that had decline of the visits over third and tforth quater.

 ![Graph](https://github.com/HanaHrubesova/Homework/blob/main/QoQ%20Analysis.png)

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

> Script are in the : [VISITS ANALYSIS.sql]()

- For all the visits in the file, calculate cohorts (groups) of visits durations (in seconds) of all of the users, meaning that for each group, you should present the number of users it contains as well as their share out of the total users.
You will need to convert the timeonsite from milliseconds to seconds
You can choose the cohorts yourself according to what you think fits the data, feel free to add a short explanation in a comment if there’s any particular reason you chose it.

> It is important to chose cohorts that cover the greater part othe the data distribution. The cohort need to be equali divided to be comparable.

  An output for example is:

| Visit duration cohort	| 0-20 | 20-40 | 40-60 | 60-100	| 100-200 |	200+ |
|-----------------------|------|-------|-------|--------|---------|------|
| Number of users       | 1024 | 877   | 506   | 405	| 54	  | 76   |
| Share of users        | 35%  | 30%   | 17%   | 13%	| 2%	  | 3%   |

Create a visualization to display these results.

> The script in the : [VISITS ANALYSIS-timeblok.sql]()

> The data:

  | Visit duration cohort [sec]	| 0-100  | 101-200 | 201-300 | 301-400| 401-500 | 501-600 | 601-700 | 701-800 |801-900 | 901-1000 | 1000+ |
  |-----------------------------|--------|---------|---------|--------|---------|---------|---------|---------|--------|----------|-------|
  | Number of users             | 40527  | 299     | 1655    | 29324  | 3060	| 1626    | 3038    | 1681    | 1001   | 869      | 7326  |
  | Share of users              | 43,53% | 3,22%   | 1,78%   | 31,5%  | 3,29%   | 1,75%   | 3,26%   | 1,81%   | 1,08%  | 0,93%    | 7.87% |

> Choosing the right visualization is necessary to choose the what is the important information. For showing the distribution of the users in the dependent of the cohorts:
 ![Graph](https://github.com/HanaHrubesova/Homework/blob/main/Visits%20analysis_1.png)
To show the user distributed in the dependent of the whole od users:
 ![Graph](https://github.com/HanaHrubesova/Homework/blob/main/Visits%20Analysis.png)

# PYTHON DATA MANIPULATION - 20% 
This part of the test will include a datwa manipulation exercise using Python over the
following file: airbnb_clickstream_sample.csv_

OSS - On Site Search is the definition of the searched keywords within the website itself
For example when searching for “Shoes” on Amazon you get to the following page:
[https://www.amazon.com/s?k=shoes&ref=nb_sb_noss_2](https://www.amazon.com/s?k=shoes&ref=nb_sb_noss_2)

Additional example when searching for a team / event on StabHub you get the following
page:
[https://www.stubhub.com/find/s/?q=maccabi%20haifa](https://www.stubhub.com/find/s/?q=maccabi%20haifa)

Note that in each case there is a parameter on the results URL that indicates the
keywords that were searched.

The task is, using Python, to find the top searched keywords in the AIRBNB
clickstream. You will need to extract all keywords and count their instances, showing
the top 10-20 results.

> The code is in the : [PYTHON DATA MANIPULATION.py](https://github.com/HanaHrubesova/Homework/blob/main/PYTHON%20DATA%20MANIPULATION.py)
