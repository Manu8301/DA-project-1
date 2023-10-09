use spot

select * from spotify_data;

select top 10 artist,COUNT(song_title) as song from spotify_data group by artist order by song  desc; --group by is required while using count

select top 10 song_title ,energy from spotify_data order by energy desc;

select top 10 song_title ,duration_ms from spotify_data order by duration_ms desc;

select top 10 song_title ,tempo from spotify_data order by tempo desc;


select top 10 song_title ,loudness from spotify_data order by loudness ;


select top 10 song_title ,danceability from spotify_data order by danceability desc;