USE UACFootball;

-- Speed up searches by team
CREATE INDEX idx_coaches_teams ON Coaches (team_id);
CREATE INDEX idx_players_team ON Players (team_id);
CREATE INDEX idx_games_home_team ON Games (home_team_id);
CREATE INDEX idx_games_away_team ON Games (away_team_id);

-- Speed up searches by player and position
CREATE INDEX idx_players_position ON Players (position_id);
CREATE INDEX idx_playerstats_player ON PlayerStats (player_id);
CREATE INDEX idx_playerstats_game ON PlayerStats (game_id);