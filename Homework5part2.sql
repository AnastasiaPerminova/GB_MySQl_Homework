CREATE DATABASE IF NOT EXISTS homework5;

USE homework5;

DROP TABLE IF EXISTS train_timetable;
CREATE TABLE train_timetable
(	id INT NOT NULL PRIMARY KEY auto_increment,
	train_id INT,
    station VARCHAR(20),
    station_time TIME
);

INSERT INTO train_timetable (train_id, station, station_time) 
VALUES
	(110, "San_Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San_Jose", "12:35:00"),
	(120, "San_Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
	(120, "San_Jose", "13:30:00");
    
SELECT * FROM train_timetable;
          
SELECT 
	train_id, 
	station, 
    station_time,
	TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id), station_time) as time_to_next_station
FROM train_timetable;
