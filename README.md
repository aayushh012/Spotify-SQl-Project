# Spotify-SQl-Project
This project showcases advanced SQL skills using a Spotify-like dataset.   It covers **database schema creation, data cleaning, exploratory data analysis (EDA), and advanced SQL queries** to answer real-world business questions.
##  Project Highlights
- **Database Setup**
  - Created a normalized table `spotify` with attributes like artist, track, album, streams, views, likes, and audio features (danceability, energy, liveness, etc.).
  
- **Data Cleaning & EDA**
  - Removed invalid records (e.g., tracks with `duration_min = 0`).
  - Explored dataset: number of artists, album types, channels, and track duration distribution.

- **SQL Queries**
  - Retrieve tracks with more than 1 billion streams.
  - List all albums along with their respective artists.
  - Find all tracks that belong to the album type single.
  - Count the total number of tracks by each artist.
  - Find total comments on licensed tracks.
  - Count number of tracks per artist.
  - Calculate average danceability per album.
  - Top 5 tracks by energy.
  - Tracks with more streams on Spotify vs YouTube.
  - **Advanced Queries using Window Functions**:
    - Top 3 most-viewed tracks per artist.
    - Tracks with liveness score above average.

- **Techniques Used**
  - Common Table Expressions (CTEs)
  - Window Functions (`ROW_NUMBER`, `RANK`)
  - Aggregate Functions (`SUM`, `AVG`, `COUNT`)
  - Filtering and Conditional Logic (`CASE`, `COALESCE`)
  - Data Cleaning (`DELETE`, `DISTINCT`, validation checks)

---

## 📊 Key Learnings
- How to design and query a relational database.
- Applying SQL to solve real-world data problems.
- Using advanced SQL features for analytics.
- Preparing datasets for business insights.
