USE UACFootball;

-- Populates all 9 UAC teams
INSERT INTO Teams (team_name, abbreviation, city, state) VALUES
('Southern Utah Thunderbirds', 'SUU', 'Cedar City', 'UT'),
('Tarleton State Texans', 'TSU', 'Stephenville', 'TX'),
('Abilene Christian Wildcats', 'ACU', 'Abilene', 'TX'),
('Austin Peay Governors', 'APSU', 'Clarksville', 'TN'),
('Central Arkansas Bears', 'UCA', 'Conway', 'AR'),
('North Alabama Lions', 'UNA', 'Florence', 'AL'),
('Eastern Kentucky Colonels', 'EKU', 'Richmond', 'KY'),
('West Georgia Wolves', 'UWG', 'Carrollton', 'GA'),
('Utah Tech Trailblazers', 'UT', 'St. George', 'UT');

-- Populating head coaches for all UAC teams
INSERT INTO Coaches (first_name, last_name, email, experience_years, team_id) VALUES
('DeLane', 'Fitzgerald', 'dfitzgerald@suu.edu', 12, 1),
('Todd', 'Whitten', 'twhitten@tarleton.edu', 18, 2),
('Keith', 'Patterson', 'kpatterson@acu.edu', 20, 3),
('Jeff', 'Faris', 'jfaris@apsu.edu', 8, 4),
('Nathan', 'Brown', 'nbrown@uca.edu', 15, 5),
('Brent', 'Dearmon', 'bdearmon@una.edu', 10, 6),
('Walt', 'Wells', 'wwells@eku.edu', 14, 7),
('Joel', 'Taylor', 'jtaylor@westga.edu', 6, 8),
('Ricky', 'Sanchez', 'rsanchez@utahtech.edu', 5, 9);

-- Populating offensive positions
INSERT INTO Positions (position_name, position_abbr) VALUES
('Quarterback', 'QB'),
('Running Back', 'RB'),
('Wide Receiver', 'WR'),
('Tight End', 'TE'),
('Offensive Lineman', 'OL'),
('Fullback', 'FB');

-- Populatiung returning offensive players
INSERT INTO Players (first_name, last_name, year, team_id, position_id) VALUES
('Joshua', 'Dye', 'Sophomore', 1, 2),
('Bronson', 'Barron', 'Senior', 1, 1),
('Shane', 'Carr', 'Junior', 1, 3),
('Victor', 'Gabalis', 'Senior', 2, 1),
('Kayvon', 'Britten', 'Senior', 2, 2),
('Darius', 'Cooper', 'Senior', 2, 3),
('Austin', 'Smith', 'Graduate', 4, 1),
('Stone', 'Earle', 'Senior', 3, 1),
('Rovaughn', 'Banks', 'Junior', 3, 2),
('Will', 'McElvain', 'Senior', 5, 1),
('Myles', 'Burkett', 'Junior', 7, 1),
('Reggie', 'Graff', 'Junior', 9, 1);

-- Populating real 2025 UAC season games
INSERT INTO Games (home_team_id, away_team_id, game_date, home_score, away_score) VALUES
(7, 1, '2025-11-08', 17, 27),
(6, 1, '2025-11-22', 34, 36),
(2, 4, '2025-11-22', 45, 44),
(3, 6, '2025-10-04', 28, 14),
(5, 2, '2025-09-27', 13, 34),
(1, 3, '2025-10-18', 14, 28),
(4, 7, '2025-10-11', 56, 28),
(8, 3, '2025-10-11', 21, 35),
(2, 5, '2025-10-25', 38, 17),
(7, 5, '2025-11-22', 34, 13);

-- Populating real 2025 UAC player offensive stats
INSERT INTO PlayerStats (player_id, game_id, passing_yards, rushing_yards, receiving_yards, touchdowns) VALUES
(1, 1, 0, 221, 0, 3),
(1, 2, 0, 108, 0, 3),
(2, 1, 256, 18, 0, 2),
(2, 2, 198, 12, 0, 1),
(3, 1, 0, 0, 124, 1),
(4, 3, 320, 22, 0, 3),
(5, 3, 0, 98, 0, 1),
(6, 3, 0, 0, 87, 1),
(7, 7, 245, 15, 0, 2),
(8, 6, 198, 20, 0, 2),
(9, 6, 0, 112, 0, 1),
(10, 5, 187, 8, 0, 1);

SELECT * FROM Teams;

-- Error when creating coaching table, DROPPED table & readded
SELECT * FROM Coaches;
DELETE FROM Coaches;

ALTER TABLE Coaches AUTO_INCREMENT = 1;

INSERT INTO Coaches (first_name, last_name, email, experience_years, team_id) VALUES
('DeLane', 'Fitzgerald', 'dfitzgerald@suu.edu', 12, 1),
('Todd', 'Whitten', 'twhitten@tarleton.edu', 18, 2),
('Keith', 'Patterson', 'kpatterson@acu.edu', 20, 3),
('Jeff', 'Faris', 'jfaris@apsu.edu', 8, 4),
('Nathan', 'Brown', 'nbrown@uca.edu', 15, 5),
('Brent', 'Dearmon', 'bdearmon@una.edu', 10, 6),
('Walt', 'Wells', 'wwells@eku.edu', 14, 7),
('Joel', 'Taylor', 'jtaylor@westga.edu', 6, 8),
('Ricky', 'Sanchez', 'rsanchez@utahtech.edu', 5, 9);

SELECT * FROM Coaches;

CREATE TABLE Coaches ( coach_id INT NOT NULL AUTO_INCREMENT, first_name VARCHAR (50), last_name VARCHAR (50) , email VARCHAR (100)  ,
experience_years INT, team_id INT , PRIMARY KEY (coach_id) , FOREIGN KEY (team_id) REFERENCES Teams (team_id)
);

INSERT INTO Coaches (first_name, last_name, email, experience_years, team_id) VALUES
('DeLane', 'Fitzgerald', 'dfitzgerald@suu.edu', 12, 1),
('Todd', 'Whitten', 'twhitten@tarleton.edu', 18, 2),
('Keith', 'Patterson', 'kpatterson@acu.edu', 20, 3),
('Jeff', 'Faris', 'jfaris@apsu.edu', 8, 4),
('Nathan', 'Brown', 'nbrown@uca.edu', 15, 5),
('Brent', 'Dearmon', 'bdearmon@una.edu', 10, 6),
('Walt', 'Wells', 'wwells@eku.edu', 14, 7),
('Joel', 'Taylor', 'jtaylor@westga.edu', 6, 8),
('Ricky', 'Sanchez', 'rsanchez@utahtech.edu', 5, 9);

SELECT * FROM Coaches;
SELECT * FROM Positions;
SELECT * FROM Players;
SELECT * FROM Games;
SELECT * FROM PlayerStats;