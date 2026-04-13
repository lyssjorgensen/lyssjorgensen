CREATE DATABASE UACFootball;

USE UACFootball;

-- Table: All 9 UAC teams
CREATE TABLE Teams ( team_id INT NOT NULL AUTO_INCREMENT,
team_name VARCHAR(100) , abbreviation VARCHAR (10), city VARCHAR (100) , state VARCHAR (50), 
PRIMARY KEY (team_id)
);

-- Table: All 9 UAC head coaches linked to each team
CREATE TABLE Coaches ( coach_id INT NOT NULL AUTO_INCREMENT, first_name VARCHAR (50), last_name VARCHAR (50) , email VARCHAR (100)  ,
experience_years INT, team_id INT , PRIMARY KEY (coach_id) , FOREIGN KEY (team_id) REFERENCES Teams (team_id)
);

-- Table: Offensive positions (QB,RB,WR,TE,OL)
CREATE TABLE Positions (
    position_id INT NOT NULL AUTO_INCREMENT, position_name VARCHAR(50),
    position_abbr VARCHAR(10),
    PRIMARY KEY (position_id)
);

-- Table: Returning offensive players linked to teams and positions
CREATE TABLE Players (
    player_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    year VARCHAR(50),
    team_id INT,
    position_id INT,
    PRIMARY KEY (player_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id)
);

-- Table: 2025 UAC Seasib games with scores
CREATE TABLE Games (
    game_id INT NOT NULL AUTO_INCREMENT,
    home_team_id INT,
    away_team_id INT,
    game_date DATE,
    home_score INT,
    away_score INT,
    PRIMARY KEY (game_id),
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);

--Table: Individual offensive stats per player per game
CREATE TABLE PlayerStats (
    stat_id INT NOT NULL AUTO_INCREMENT,
    player_id INT,
    game_id INT,
    passing_yards INT,
    rushing_yards INT,
    receiving_yards INT,
    touchdowns INT,
    PRIMARY KEY (stat_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

SHOW TABLES;