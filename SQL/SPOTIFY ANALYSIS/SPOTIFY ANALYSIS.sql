--Spotify dataset Analysis--

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
    VIEWS FLOAT,
    likes BIGINT,
    COMMENTS BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

SELECT * FROM spotify

-----------------------EDA---------------------------

SELECT count( * ) FROM spotify

SELECT count(DISTINCT artist) FROM spotify

SELECT count(DISTINCT album) FROM spotify

SELECT DISTINCT album_type FROM spotify

SELECT max(duration_min) FROM spotify
SELECT min(duration_min) FROM spotify

SELECT * FROM spotify WHERE duration_min=0
DELETE FROM spotify WHERE duration_min=0

SELECT DISTINCT channel FROM spotify

SELECT DISTINCT most_played_on FROM spotify

-------------------------------------
--Data Analysis-Easy Category--
--------------------------------------

--Retrieve the names of all tracks that have more than 1 billion streams.--

SELECT track FROM spotify WHERE stream>1000000000

--List all albums along with their respective artists.--

SELECT album,artist FROM spotify GROUP BY album,artist

--Get the total number of comments for tracks where licensed = TRUE.--

SELECT sum(COMMENTS) AS total_comments FROM spotify WHERE licensed='true'

--Find all tracks that belong to the album type single.--

SELECT * FROM spotify WHERE album_type='single'

--Count the total number of tracks by each artist.--

SELECT artist,count(track) AS total_no_songs FROM spotify GROUP BY artist

-----------------------Medium Level Question-----------------------------

--Calculate the average danceability of tracks in each album.--

SELECT album,avg(danceability) AS avg_danceability FROM spotify GROUP BY album ORDER BY 2 DESC

--Find the top 5 tracks with the highest energy values.--

SELECT track,avg(energy) AS avg_energy FROM spotify GROUP BY track ORDER BY avg_energy DESC LIMIT 5

--List all tracks along with their views and likes where official_video = TRUE.--

SELECT DISTINCT track,sum(VIEWS),sum(likes) FROM spotify WHERE official_video='true' GROUP BY track 

--For each album, calculate the total views of all associated tracks.--

SELECT album,track,sum(VIEWS) AS total_views FROM spotify GROUP BY album,track ORDER BY total_views  DESC


--Retrieve the track names that have been streamed on Spotify more than YouTube.--

doubt

--------------------------ADVANCE LEVEL-------------------------------------------

--Find the top 3 most-viewed tracks for each artist using window functions.--
WITH ranking_artist AS
(SELECT artist,track,sum(VIEWS) AS total_views,dense_rank() OVER (PARTITION BY artist ORDER BY sum(VIEWS) DESC ) AS rank  FROM spotify GROUP BY 1,2 ORDER BY 1,3 DESC)
SELECT * FROM ranking_artist WHERE rank<=3

--Write a query to find tracks where the liveness score is above the average.--

SELECT artist,track,liveness FROM spotify WHERE liveness>(SELECT avg(liveness) FROM spotify) ORDER BY liveness DESC

--Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.--

WITH highlow AS
(SELECT album,max(energy) AS high_energy,min(energy) AS low_energy FROM spotify GROUP BY 1)
SELECT album,high_energy - low_energy AS diff_energy FROM highlow ORDER BY 2 DESC
