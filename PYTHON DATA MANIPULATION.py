import pandas as pd
from urllib.parse import urlparse, parse_qs

# Load the data
file_path = r"C:\Users\hrubh\Downloads\airbnb_clickstream_sample.csv"  #
df = pd.read_csv(file_path)

# Clean the url
urls = df['Page'].dropna() 

# Extrack search tearm
def extract_keywords(url):
      path = urlparse(url).path
      if "/s/" in path:
            search_term = path.split("/s/")[1].split("/")[0]  # extract term between "s/" & "/"
            
            return search_term


df['keywords'] = urls.apply(extract_keywords)

# Filter for non-null keywords and count occurrences
keyword_counts = df['keywords'].dropna().value_counts()


# Display top 20 keywords
#top_keywords = keyword_counts.head(20)

#Sorting keywords by they count
top_keywords = keyword_counts.sort_values(ascending= False)

#Chosing keywords in top 10_20
top_10_20 = top_keywords.iloc[10:20]

print("Top 10-20 Searched Keywords:")
print(top_10_20)


