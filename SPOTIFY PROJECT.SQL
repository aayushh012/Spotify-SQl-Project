-- Advanced SQL PROJECT

-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);


-- EDA

Select count(*) from spotify;

Select count(distinct artist) from spotify;

Select distinct album_type from spotify;

Select max(duration_min) from spotify;

Select min(duration_min) from spotify;

Select *
from spotify 
where duration_min=0;

Delete 
from spotify
where duration_min=0;


Select distinct channel 
from spotify;


-- Data Analysis 

--Retrieve the names of all tracks that have more than 1 billion streams.


Select track,stream
from spotify
where stream>10000000;

--List all albums along with their respective artists.


Select album,artist
from spotify;

--Get the total number of comments for tracks where licensed = TRUE.


Select track,count(comments)
from spotify
where licensed='true'
group by track;


--Find all tracks that belong to the album type single.


Select track,album_type
from spotify
where album_type='single';



--Count the total number of tracks by each artist.


Select artist,count(track) as "Number Of Tracks"
from spotify
group by artist
order by count(track) desc;


--Calculate the average danceability of tracks in each album.


Select album,avg(danceability) as avg_danceability
from spotify
group by album
order by avg(danceability) desc;


--Find the top 5 tracks with the highest energy values.


Select track,avg(energy)
from spotify
group by track
order by avg(energy) desc
limit 5;

--List all tracks along with their views and likes where official_video = TRUE.


Select track,sum(views) as total_views,sum(likes) as total_likes
from spotify
where official_video='True'
group by track
order by sum(likes) desc
;


--For each album, calculate the total views of all associated tracks.

select album,track,sum(views) as total_views
from spotify
group by album,track
order by sum(views) desc;



--Retrieve the track names that have been streamed on Spotify more than YouTube.

Select *
from 
(Select track,
coalesce(sum(Case when most_played_on='Youtube' then stream END),0) as streamed_on_youtube,
coalesce(sum(Case when most_played_on='Spotify' then stream END),0) as streamed_on_spotify
from spotify
group by track) as t1
where streamed_on_spotify>streamed_on_youtube
AND streamed_on_youtube <>0 
;



--Find the top 3 most-viewed tracks for each artist using window functions.
with track_views as
(Select track,artist,sum(views) as total_views
from spotify
group by track,artist
order by sum(views) desc)
,ranked as
(
Select track,artist,total_views,row_number() over(partition by artist order by total_views desc)as row_num
from track_views
)
Select *
from ranked
where row_num<=3;

--Write a query to find tracks where the liveness score is above the average.

with cte as
(Select avg(liveness) as avg_liveness from spotify)
Select s.track,s.liveness
from spotify s
cross join cte c
where s.liveness>c.avg_liveness
;

