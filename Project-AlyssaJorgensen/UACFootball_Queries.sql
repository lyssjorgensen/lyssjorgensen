USE UACFootball;

-- Show all players and their team name
SELECT Players.first_name , Players.last_name , Players.year , Teams.team_name FROM Players JOIN Teams ON Players.team_id = Teams.team_id;

-- Count how many players each team has
SELECT Teams.team_name , COUNT(Players.player_id) AS total_players FROM Teams JOIN Players ON Teams.team_id = Players.team_id GROUP BY Teams.team_name;

-- Show all Quarterbacks using a WHERE clause
SELECT Players.first_name, Players.last_name, Teams.team_name,
Positions.position_name FROM Players JOIN Teams ON Players.team_id = Teams.team_id 
JOIN Positions ON Players.position_id = Positions.position_id WHERE Positions.position_name = 'Quarterback' ;

-- Show players who scored more than 1 touchdown using HAVING
SELECT Players.first_name, Players.last_name, Teams.team_name, SUM(PlayerStats.touchdowns) 
AS total_touchdowns FROM Players JOIN PlayerStats ON Players.player_id= PlayerStats.player_id JOIN Teams 
ON Players.team_id = Teams.team_id GROUP BY Players.first_name, Players.last_name, Teams.team_name 
HAVING SUM(PlayerStats.touchdowns) > 1;

-- Show players who had more rushing yards than the average using a subquery
SELECT Players.first_name, Players.last_name, Teams.team_name, PlayerStats.rushing_yards
FROM Players JOIN PlayerStats ON Players.player_id = PlayerStats.player_id
JOIN Teams ON Players.team_id = Teams.team_id WHERE PlayerStats.rushing_yards > ( SELECT AVG(rushing_yards)
FROM PlayerStats WHERE rushing_yards > 0
);

-- Show the highest rushing yards recorded in each game
SELECT Games.game_id, Teams.team_name AS home_team, Games.game_date, Players.first_name, Players.last_name,
MAX(Playerstats.rushing_yards) AS top_rushing_yards FROM Games JOIN Teams ON Games.home_team_id = Teams.team_id
JOIN Playerstats ON Games.game_id = Playerstats.game_id JOIN Players ON PlayerStats.player_id = Players.player_id GROUP BY Games.game_id,
Teams.team_name, Games.game_date,Players.first_name,Players.last_name HAVING MAX(PlayerStats.rushing_yards) > 0
ORDER BY top_rushing_yards DESC;