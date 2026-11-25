/* Presented by Group 1*/
/* Esports Tournaments Management System*/

/* Notes */
/* to ensure proper testing of the following SQL Statements*/
/* in Live Oracle SQL, First Paste the CREATE Table and All INSERT Statements ONLY*/
/* Then Press 'RUN', 2 to 3 Times! to ensure all tables are created, pressing it once will NOT work*/
/* Finally you can copy and paste ALL Statements from the Initial SELECT* Statements down to the Stored Procedures*/
/* ALL Tables should appear correctly in the Output identical to the PDF submission*/
/* Thank You*/



/* TOURNAMENT TABLE */
CREATE TABLE Tournament (
    TournamentID NUMBER PRIMARY KEY,
    ArenaID NUMBER,
    TournamentName VARCHAR2(100) NOT NULL,
    PlayedGame VARCHAR2(50),
    WinningPrize NUMBER,
    TournamentDate DATE,
/* TOURNAMENT TABLE CONSTRAINTS */
    CONSTRAINT fk_ArenaID FOREIGN KEY (ArenaID) REFERENCES Arena(ArenaID)
);

/* TEAM TABLE */
CREATE TABLE Team (
    TeamID NUMBER PRIMARY KEY,
    TeamName VARCHAR2(100) UNIQUE NOT NULL,
    CoachName VARCHAR2(100),
    Region VARCHAR2(50)
);

/* PLAYER TABLE */
CREATE TABLE Player (
    PlayerID NUMBER PRIMARY KEY,
    PlayerName VARCHAR2(100) NOT NULL,
    PlayerRole VARCHAR2(50),
    TeamID NUMBER,
/* PLAYER TABLE CONSTRAINTS */
    CONSTRAINT fk_TeamID FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

/* MATCH TABLE */
CREATE TABLE Match (
    MatchID NUMBER PRIMARY KEY,
    Team1ID NUMBER,
    Team2ID NUMBER,
    FirstTeamScore NUMBER,
    SecondTeamScore NUMBER,
    TournamentID NUMBER,
    ArenaID NUMBER,
/* MATCH TABLE CONSTRAINTS */
    CONSTRAINT fk_Team1ID FOREIGN KEY (Team1ID) REFERENCES Team(TeamID),
    CONSTRAINT fk_Team2ID FOREIGN KEY (Team2ID) REFERENCES Team(TeamID),
    CONSTRAINT fk_TournamentID FOREIGN KEY (TournamentID) REFERENCES Tournament(TournamentID),
    CONSTRAINT fk_MatchArenaID FOREIGN KEY (ArenaID) REFERENCES Arena(ArenaID)
);

/* ARENA TABLE */
CREATE TABLE Arena (
    ArenaID NUMBER PRIMARY KEY,
    ArenaName VARCHAR2(100) NOT NULL,
    City VARCHAR2(50),
    Capacity NUMBER
);

/* TOURNAMENTTEAMS TABLE (ASSOCIATIVE ENTITY) */
CREATE TABLE TournamentTeams (
    TournamentID NUMBER,
    TeamID NUMBER,
/* TOURNAMENTTEAMS TABLE CONSTRAINTS */
    PRIMARY KEY (TournamentID, TeamID),
    CONSTRAINT fk_TournamentID_TournamentTeams FOREIGN KEY (TournamentID) REFERENCES Tournament(TournamentID),
    CONSTRAINT fk_TeamID_TournamentTeams FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

/* TOURNAMENTMATCHES TABLE (ASSOCIATIVE ENTITY) */
CREATE TABLE TournamentMatches (
    TournamentID NUMBER,
    MatchID NUMBER,
/* TOURNAMENTMATCHES TABLE CONSTRAINTS */
    PRIMARY KEY (TournamentID, MatchID),
    CONSTRAINT fk_TournamentID_TournamentMatches FOREIGN KEY (TournamentID) REFERENCES Tournament(TournamentID),
    CONSTRAINT fk_MatchID_TournamentMatches FOREIGN KEY (MatchID) REFERENCES Match(MatchID)
);


-------------------------------------------
/* POPULATE TOURNAMENT TABLE WITH 5 ESPORT TOURNAMENTS */
INSERT INTO Tournament (TournamentID, ArenaID, TournamentName, PlayedGame, WinningPrize, TournamentDate) 
    VALUES (1, 1, 'The Overwatch World League', 'Overwatch', 150000, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO Tournament (TournamentID, ArenaID, TournamentName, PlayedGame, WinningPrize, TournamentDate) 
    VALUES (2, 2, 'Apex Legends World Cup', 'Apex Legends', 80000, TO_DATE('2024-03-10', 'YYYY-MM-DD'));
INSERT INTO Tournament (TournamentID, ArenaID, TournamentName, PlayedGame, WinningPrize, TournamentDate) 
    VALUES (3, 3, 'FIFA: ESports World Cup', 'FIFA 24', 500000, TO_DATE('2024-04-20', 'YYYY-MM-DD'));
INSERT INTO Tournament (TournamentID, ArenaID, TournamentName, PlayedGame, WinningPrize, TournamentDate) 
    VALUES (4, 4, 'Siege Cup', 'Rainbow Six Siege', 150000, TO_DATE('2024-05-12', 'YYYY-MM-DD'));
INSERT INTO Tournament (TournamentID, ArenaID, TournamentName, PlayedGame, WinningPrize, TournamentDate) 
    VALUES (5, 5, 'Rocket League Championship', 'Rocket League', 100000, TO_DATE('2024-06-18', 'YYYY-MM-DD'));

/* POPULATE 5 ARENAS FOR EACH TOURNAMENT */
INSERT INTO Arena (ArenaID, ArenaName, City, Capacity)
    VALUES (1, 'EVA Park', 'Riyadh', 30000);
INSERT INTO Arena (ArenaID, ArenaName, City, Capacity)
    VALUES (2, 'Jeddah Superdome', 'Jeddah', 25000);
INSERT INTO Arena (ArenaID, ArenaName, City, Capacity) 
    VALUES (3, 'Riyadh Boulevard Arena', 'Riyadh', 35000);
INSERT INTO Arena (ArenaID, ArenaName, City, Capacity) 
    VALUES (4, 'Dhahran Expo', 'Khobar', 13000);
INSERT INTO Arena (ArenaID, ArenaName, City, Capacity) 
    VALUES (5, 'KASC Arena', 'Jeddah', 17000);

/* POPULATING TEAM TABLE WITH 12 TEAMS */
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (1, 'Cloud9', 'Coach 01', 'USA');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (2, 'Virtus Pro', 'Coach 02', 'South Korea');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (3, 'Sandstorm', 'Coach 03', 'Saudi Arabia');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (4, 'Berlin Fuel', 'Coach 04', 'Germany');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (5, 'Eagles', 'Coach 05', 'Saudi Arabia');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (6, 'Fnatic', 'Coach 06', 'United Kingdom');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (7, 'G2 Esports', 'Coach 07', 'Germany');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (8, 'TSM', 'Coach 08', 'USA');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (9, 'Astralis', 'Coach 09', 'Denmark');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (10, 'Evil Geniuses', 'Coach 10', 'USA');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (11, 'NRG Esports', 'Coach 11', 'USA');
INSERT INTO Team (TeamID, TeamName, CoachName, Region) 
    VALUES (12, '100 Thieves', 'Coach 12', 'USA');


/* Players for Teams 1 - 6 */
/* Players for Team 1: Cloud9 */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (1, 'Player 01', 'Sports Specialist', 1);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (2, 'Player 02', 'Shooter Specialist', 1);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (3, 'Player 03', 'Battle Royale Specialist', 1);

/* Players for Team 2: Virtus Pro */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (4, 'Player 04', 'Sports Specialist', 2);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (5, 'Player 05', 'Shooter Specialist', 2);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (6, 'Player 06', 'Battle Royale Specialist', 2);

/* Players for Team 3: Sandstorm */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (7, 'Player 07', 'Sports Specialist', 3);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (8, 'Player 08', 'Shooter Specialist', 3);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (9, 'Player 09', 'Battle Royale Specialist', 3);

/* Players for Team 4: Berlin Fuel */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (10, 'Player 10', 'Sports Specialist', 4);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (11, 'Player 11', 'Shooter Specialist', 4);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (12, 'Player 12', 'Battle Royale Specialist', 4);

/* Players for Team 5: Eagles */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (13, 'Player 13', 'Sports Specialist', 5);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (14, 'Player 14', 'Shooter Specialist', 5);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (15, 'Player 15', 'Battle Royale Specialist', 5);

/* Players for Team 6: Fnatic */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (16, 'Player 16', 'Sports Specialist', 6);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (17, 'Player 17', 'Shooter Specialist', 6);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (18, 'Player 18', 'Battle Royale Specialist', 6);

/* Players for Teams 7 - 12 */
/* Players for Team 7: G2 Esports */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (19, 'Player 19', 'Shooter Specialist', 7);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (20, 'Player 20', 'Sports Specialist', 7);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (21, 'Player 21', 'Battle Royale Specialist', 7);

/* Players for Team 8: TSM */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (22, 'Player 22', 'Shooter Specialist', 8);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (23, 'Player 23', 'Sports Specialist', 8);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (24, 'Player 24', 'Battle Royale Specialist', 8);

/* Players for Team 9: Astralis */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (25, 'Player 25', 'Shooter Specialist', 9);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (26, 'Player 26', 'Sports Specialist', 9);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (27, 'Player 27', 'Battle Royale Specialist', 9);

/* Players for Team 10: Evil Geniuses */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (28, 'Player 28', 'Shooter Specialist', 10);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (29, 'Player 29', 'Sports Specialist', 10);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (30, 'Player 30', 'Battle Royale Specialist', 10);

/* Players for Team 11: NRG Esports */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (31, 'Player 31', 'Shooter Specialist', 11);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (32, 'Player 32', 'Sports Specialist', 11);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (33, 'Player 33', 'Battle Royale Specialist', 11);

/* Players for Team 12: 100 Thieves */
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (34, 'Player 34', 'Shooter Specialist', 12);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (35, 'Player 35', 'Sports Specialist', 12);
INSERT INTO Player (PlayerID, PlayerName, PlayerRole, TeamID) 
    VALUES (36, 'Player 36', 'Battle Royale Specialist', 12);



/* 12 MATCHES ACROSS VARIOUS TOURNAMENTS*/

/* Match 1: Cloud9 vs Virtus Pro in The Overwatch World League, score 3-2 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (1, 1, 2, 3, 2, 1, 1);

/* Match 2: Sandstorm vs Berlin Fuel in Apex Legends World Cup, score 1-2 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (2, 3, 4, 1, 2, 2, 2);

/* Match 3: Eagles vs Cloud9 in FIFA: ESports World Cup, score 6-1 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (3, 5, 1, 6, 1, 3, 3);

/* Match 4: Virtus Pro vs Sandstorm in Siege Cup, score 5-3 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (4, 2, 3, 5, 3, 4, 4);

/* Match 5: Berlin Fuel vs Eagles in Rocket League Championship, score 3-0 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (5, 4, 5, 3, 0, 5, 5);

/* Match 6: Fnatic vs G2 Esports in The Overwatch World League, score 2-3 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (6, 6, 7, 2, 3, 1, 1);

/* Match 7: TSM vs Astralis in Apex Legends World Cup, score 4-1 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (7, 8, 9, 4, 1, 2, 2);

/* Match 8: Evil Geniuses vs NRG Esports in FIFA: ESports World Cup, score 1-5 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (8, 10, 11, 1, 5, 3, 3);

/* Match 9: Fnatic vs TSM in Siege Cup, score 3-3 (tie) */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (9, 6, 8, 3, 3, 4, 4);

/* Match 10: Astralis vs NRG Esports in Rocket League Championship, score 6-2 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (10, 9, 11, 6, 2, 5, 5);

/* Match 11: G2 Esports vs Evil Geniuses in The Overwatch World League, score 2-4 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (11, 7, 10, 2, 4, 1, 1);

/* Match 12: 100 Thieves vs NRG Esports in The Overwatch World League, score 3-4 */
INSERT INTO Match (MatchID, Team1ID, Team2ID, FirstTeamScore, SecondTeamScore, TournamentID, ArenaID) 
    VALUES (12, 12, 11, 3, 4, 1, 1);



/* POPULATING TOURNAMENTTEAMS TABLE (ASSOCIATIVE ENTITY) */

/* Team 6 (Fnatic) is playing in Tournament 1 (The Overwatch World League) and Tournament 3 (FIFA: ESports World Cup) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (1, 6);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (3, 6);

/* Team 7 (G2 Esports) is playing in Tournament 1 (The Overwatch World League) and Tournament 4 (Siege Cup) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (1, 7);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (4, 7);

/* Team 8 (TSM) is playing in Tournament 2 (Apex Legends World Cup) and Tournament 5 (Rocket League Championship) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (2, 8);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (5, 8);

/* Team 9 (Astralis) is playing in Tournament 3 (FIFA: ESports World Cup) and Tournament 4 (Siege Cup) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (3, 9);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (4, 9);

/* Team 10 (Evil Geniuses) is playing in Tournament 4 (Siege Cup) and Tournament 5 (Rocket League Championship) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (4, 10);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (5, 10);

/* Team 11 (NRG Esports) is playing in Tournament 1 (The Overwatch World League) and Tournament 5 (Rocket League Championship) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (1, 11);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (5, 11);

/* Team 12 (100 Thieves) is playing in Tournament 1 (The Overwatch World League) and Tournament 2 (Apex Legends World Cup) */
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (1, 12);
INSERT INTO TournamentTeams (TournamentID, TeamID) VALUES (2, 12);


/* POPULATING TOURNAMENTMATCHES TABLE (ASSOCIATIVE ENTITY) */

/* Tournament 1 (The Overwatch World League) includes Matches 1 - 6 - 11 - 12 */
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (1, 1);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (1, 6);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (1, 11);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (1, 12);
/* Tournament 2 (Apex Legends World Cup) includes Matches 2 - 7 */
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (2, 2);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (2, 7);
/* Tournament 3 (FIFA: ESports World Cup) includes Match 3 - 8 */
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (3, 3);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (3, 8);
/* Tournament 4 (Siege Cup) includes Matches 4 - 9 */
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (4, 4);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (4, 9);
/* Tournament 5 (Rocket League Championship) includes Matches 5 - 9 */
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (5, 5);
INSERT INTO TournamentMatches (TournamentID, MatchID) VALUES (5, 10);


------------------------------------------------------------
/* Copy from Here*/

SELECT* FROM TOURNAMENT;
SELECT* FROM TEAM;
SELECT* FROM PLAYER;
SELECT* FROM MATCH;
SELECT* FROM ARENA;
SELECT* FROM TOURNAMENTTEAMS;
SELECT* FROM TOURNAMENTMATCHES;



-- Query 1: Highest Scoring Match for Each Team ( JOIN, GROUP BY, ORDER BY, AGGREGATE FUNCTION ) ( Done )

SELECT 
    tm.TeamName AS "Team",
    t.TournamentName AS "Tournament",
    t.PlayedGame AS "Game Type",
    m.MatchID AS "Match ID",
    CASE 
        WHEN tm.TeamID = m.Team1ID THEN m.FirstTeamScore
        WHEN tm.TeamID = m.Team2ID THEN m.SecondTeamScore
    END AS "Highest Score"
FROM 
    Team tm
JOIN 
    Match m ON tm.TeamID = m.Team1ID OR tm.TeamID = m.Team2ID
JOIN 
    Tournament t ON m.TournamentID = t.TournamentID
WHERE 
    CASE 
        WHEN tm.TeamID = m.Team1ID THEN m.FirstTeamScore
        WHEN tm.TeamID = m.Team2ID THEN m.SecondTeamScore
    END = (
        SELECT MAX(
            CASE 
                WHEN tm.TeamID = m2.Team1ID THEN m2.FirstTeamScore
                WHEN tm.TeamID = m2.Team2ID THEN m2.SecondTeamScore
            END
        )
        FROM Match m2
        WHERE m2.Team1ID = tm.TeamID OR m2.Team2ID = tm.TeamID
    )
ORDER BY 
    tm.TeamName, "Highest Score" DESC;




-- Query 2: List of Teams, and which specialized player they sent to which tournament ( DONE ) 

SELECT 
    tm.TeamName AS "Team",
    p.PlayerName AS "Player",
    p.PlayerRole AS "Role",
    t.TournamentName AS "Tournament",
    t.PlayedGame AS "Game"
FROM 
    Team tm
JOIN 
    Player p ON tm.TeamID = p.TeamID
JOIN 
    TournamentTeams tt ON tm.TeamID = tt.TeamID
JOIN 
    Tournament t ON tt.TournamentID = t.TournamentID
WHERE 
    (p.PlayerRole = 'Shooter Specialist' AND t.PlayedGame IN ('Overwatch', 'Rainbow Six Siege'))
    OR (p.PlayerRole = 'Battle Royale Specialist' AND t.PlayedGame = 'Apex Legends')
    OR (p.PlayerRole = 'Sports Specialist' AND t.PlayedGame IN ('FIFA', 'Rocket League'))
ORDER BY 
    tm.TeamName, p.PlayerRole, t.PlayedGame;



-- Query 3: Lists each arena with how many tournaments it hosted and how many were games played in it ( Done ) 

SELECT 
    a.ArenaName AS "Arena",
    COUNT(DISTINCT t.PlayedGame) AS "Tournaments Hosted",
    COUNT(m.MatchID) AS "Total Matches Played"
FROM 
    Arena a
JOIN 
    Match m ON a.ArenaID = m.ArenaID
JOIN 
    Tournament t ON m.TournamentID = t.TournamentID
GROUP BY 
    a.ArenaName
ORDER BY 
    "Tournaments Hosted" DESC, "Total Matches Played" DESC;




-- Query 4: Average score for each team ( Done )

SELECT 
    tm.TeamName AS "Team",
    AVG(
        CASE 
            WHEN tm.TeamID = m.Team1ID THEN m.FirstTeamScore
            WHEN tm.TeamID = m.Team2ID THEN m.SecondTeamScore
        END
    ) AS "Average Score"
FROM 
    Team tm
JOIN 
    Match m ON tm.TeamID = m.Team1ID OR tm.TeamID = m.Team2ID
GROUP BY 
    tm.TeamName
ORDER BY 
    "Average Score" DESC;


---------------------------------------------------------


/* 1. Stored Procedure: UpdateArenaCapacity */


CREATE OR REPLACE PROCEDURE UpdateArenaCapacity (
    p_ArenaID IN NUMBER,
    p_NewCapacity IN NUMBER
) AS
BEGIN
    /* Check if the Arena exists first, then update the capacity */
    UPDATE Arena
    SET Capacity = p_NewCapacity
    WHERE ArenaID = p_ArenaID;

    /* Check if the row was updated to confirm it existed*/
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Arena not found with the given ID.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Capacity updated successfully.');
    END IF;
END;
/

/*Running the procedure*/
BEGIN
    UpdateArenaCapacity(2, 35000);
END;
/

/* To Check the updated capacity for Arena 2*/
SELECT* FROM ARENA;



/* 2. Stored Procedure: UpdatePlayerRole */

CREATE OR REPLACE PROCEDURE UpdatePlayerRole (
    p_PlayerID IN NUMBER,
    p_NewRole IN VARCHAR2
) AS
BEGIN
    /* Update the player's role based on PlayerID */
    UPDATE Player
    SET PlayerRole = p_NewRole
    WHERE PlayerID = p_PlayerID;

    /* Check if the update was successful */
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Player not found with the given ID.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Player role updated successfully.');
    END IF;
END;
/


/* Running the procedure */

BEGIN
    UpdatePlayerRole(3, 'Shooter Specialist');
END;
/

/*Check the updated role for player 3*/
SELECT * FROM Player WHERE PlayerID = 3;







