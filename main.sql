-- ========================================
-- Yalla Kora Database Project
-- Author: [Your Name]
-- Date: [Current Date]
-- Description: This script creates a comprehensive database for a soccer management system,
-- including teams, players, player statistics, tournaments, and technical staff.
-- It includes sample data, various update operations, and data analysis queries.
-- ========================================

-- ========================================
-- Database Creation & Setup
-- ========================================
CREATE DATABASE Yalla_Kora;
GO

USE Yalla_Kora;
GO

-- ========================================
-- Table Definitions
-- ========================================

-- TEAM Table: Stores team details
CREATE TABLE TEAM (
    TEAM_ID INT PRIMARY KEY,
    TEAM_NAME VARCHAR(50) NOT NULL,
    STADIUM VARCHAR(50) NULL,
    YEAR_FOUNDED INT NOT NULL
);

-- PLAYERS Table: Stores player details with a reference to TEAM
CREATE TABLE PLAYERS (
    PLAYER_NUMBER INT PRIMARY KEY,
    PLAYER_NAME VARCHAR(50) NOT NULL,
    PLAYER_AGE INT NOT NULL,
    NATION VARCHAR(50) NOT NULL,
    TEAM_ID INT REFERENCES TEAM(TEAM_ID)
);

-- PLAYER_STATS Table: Stores player performance statistics
-- Using PLAYER_NUMBER as primary key to ensure one stats record per player
CREATE TABLE PLAYER_STATS (
    PLAYER_NUMBER INT PRIMARY KEY REFERENCES PLAYERS(PLAYER_NUMBER),
    GOALS INT NULL,
    ASSISTS INT NULL,
    POSITION VARCHAR(50) NOT NULL,
    RETURN_DATE DATE NULL
);

-- TOURNAMENT Table: Stores tournament details
CREATE TABLE TOURNAMENT (
    TOURNAMENT_ID INT PRIMARY KEY,
    TOURNAMENT_PLACE VARCHAR(50) NOT NULL,
    TOURNAMENT_NAME VARCHAR(50) NOT NULL
);

-- TECHNICAL_STAFF Table: Stores coach details with a reference to TEAM
CREATE TABLE TECHNICAL_STAFF (
    COACH_ID INT PRIMARY KEY,
    COACH_NAME VARCHAR(50) NOT NULL,
    COACH_AGE INT NOT NULL,
    WIN_PERCENTAGE INT NULL,
    COACH_SALARY INT NOT NULL,
    TEAM_ID INT REFERENCES TEAM(TEAM_ID)
);

-- TEAM_TOURNAMENT Table: Junction table linking teams and tournaments
CREATE TABLE TEAM_TOURNAMENT (
    TEAM_ID INT REFERENCES TEAM(TEAM_ID),
    -- Redundant columns kept for reporting purposes. They can be derived via joins.
    TEAM_NAME VARCHAR(50) NOT NULL,
    TOURNAMENT_ID INT REFERENCES TOURNAMENT(TOURNAMENT_ID),
    TOURNAMENT_NAME VARCHAR(50) NOT NULL,
    PRIMARY KEY (TEAM_ID, TOURNAMENT_ID)
);

-- ========================================
-- Data Insertion
-- ========================================

-- Insert sample data into TEAM table
INSERT INTO TEAM (TEAM_ID, TEAM_NAME, STADIUM, YEAR_FOUNDED) VALUES
(1, 'Al Ahly', 'Cairo International Stadium', 1907),
(2, 'Zamalek', 'Cairo International Stadium', 1911),
(3, 'Barcelona', 'Camp Nou', 1899),
(4, 'Real Madrid', 'Santiago Bernabeu', 1902),
(5, 'Liverpool', 'Anfield', 1892),
(6, 'Manchester United', 'Old Trafford', 1878),
(7, 'AC Milan', 'San Siro', 1899),
(8, 'Inter Milan', 'San Siro', 1908),
(9, 'Bayern Munich', 'Allianz Arena', 1900),
(10, 'Borussia Dortmund', 'Signal Iduna Park', 1909),
(11, 'Pyramids FC', '30 June Stadium', 2008),
(12, 'Ismaily', 'Ismailia Stadium', 1924),
(13, 'Sevilla', 'Ramon Sanchez Pizjuan', 1890),
(14, 'Atletico Madrid', 'Metropolitano Stadium', 1903),
(15, 'Chelsea', 'Stamford Bridge', 1905),
(16, 'Arsenal', 'Emirates Stadium', 1886),
(17, 'AS Roma', 'Stadio Olimpico', 1927),
(18, 'Napoli', 'Stadio Diego Armando Maradona', 1926),
(19, 'RB Leipzig', 'Red Bull Arena', 2009),
(20, 'Eintracht Frankfurt', 'Deutsche Bank Park', 1899);

-- Insert sample data into PLAYERS table
INSERT INTO PLAYERS (PLAYER_NUMBER, PLAYER_NAME, PLAYER_AGE, NATION, TEAM_ID) VALUES
(101, 'Mohamed Salah', 28, 'Egypt', 5),
(102, 'Tarek Hamed', 27, 'Egypt', 2),
(103, 'Sergio Busquets', 34, 'Spain', 3),
(104, 'Luka Modric', 38, 'Spain', 4),
(105, 'Jordan Henderson', 31, 'England', 5),
(106, 'Cristiano Ronaldo', 36, 'Portugal', 4),
(107, 'Sandro Tonali', 24, 'Italy', 7),
(108, 'Nicolò Barella', 26, 'Italy', 8),
(109, 'Thomas Müller', 32, 'Germany', 9),
(110, 'Marco Reus', 25, 'Germany', 10),
(111, 'Ramadan Sobhi', 29, 'Egypt', 1),
(112, 'Hossam Hassan', 33, 'Egypt', 1),
(113, 'Jesus Navas', 30, 'Spain', 13),
(114, 'Koke', 27, 'Spain', 14),
(115, 'Raheem Sterling', 28, 'England', 15),
(116, 'Harry Kane', 35, 'England', 16),
(117, 'Nicolo Zaniolo', 23, 'Italy', 17),
(118, 'Lorenzo Insigne', 28, 'Italy', 18),
(119, 'Timo Werner', 26, 'Germany', 19),
(120, 'Kai Havertz', 24, 'Germany', 20);

-- Insert sample data into PLAYER_STATS table
INSERT INTO PLAYER_STATS (PLAYER_NUMBER, GOALS, ASSISTS, POSITION, RETURN_DATE) VALUES
(101, 20, 15, 'Forward', NULL),
(102, 10, 8, 'Midfielder', NULL),
(103, 25, 20, 'Forward', NULL),
(104, 15, 10, 'Midfielder', NULL),
(105, 22, 18, 'Forward', NULL),
(106, 18, 12, 'Forward', '2023-12-01'),
(107, 7, 5, 'Defender', '2023-11-01'),
(108, 12, 9, 'Midfielder', NULL),
(109, 19, 10, 'Forward', NULL),
(110, 10, 6, 'Defender', '2024-01-15'),
(111, 15, 8, 'Forward', NULL),
(112, 8, 10, 'Midfielder', NULL),
(113, 20, 15, 'Forward', '2024-02-01'),
(114, 14, 12, 'Defender', NULL),
(115, 5, 4, 'Midfielder', NULL),
(116, 9, 7, 'Defender', '2024-03-01'),
(117, 17, 13, 'Forward', NULL),
(118, 12, 10, 'Midfielder', NULL),
(119, 22, 16, 'Forward', '2023-12-15'),
(120, 16, 14, 'Defender', NULL);

-- Insert sample data into TOURNAMENT table
INSERT INTO TOURNAMENT (TOURNAMENT_ID, TOURNAMENT_PLACE, TOURNAMENT_NAME) VALUES
(201, 'Egypt', 'Egyptian Premier League'),
(202, 'Egypt', 'Egypt cup'),
(203, 'Spain', 'La Liga'),
(204, 'Spain', 'Spain cup'),
(205, 'England', 'Premier League'),
(206, 'England', 'FA Cup'),
(207, 'Italy', 'Serie A'),
(208, 'Italy', 'Italy cup'),
(209, 'Germany', 'Bundesliga'),
(210, 'Germany', 'Germany cup'),
(211, 'Egypt', 'Egypt FA Cup'),
(212, 'Egypt', 'Egypt u20 Cup'),
(213, 'Spain', 'Copa depay'),
(214, 'Spain', 'Copa del Rey'),
(215, 'England', 'England Cup'),
(216, 'England', 'PE Cup'),
(217, 'Italy', 'Coppa Italia'),
(218, 'Italy', 'Copa delitaly'),
(219, 'Germany', 'DFB-Pokal'),
(220, 'Germany', 'Stuttgart cup');

-- Insert sample data into TECHNICAL_STAFF table
INSERT INTO TECHNICAL_STAFF (COACH_ID, COACH_NAME, COACH_AGE, WIN_PERCENTAGE, COACH_SALARY, TEAM_ID) VALUES
(301, 'Marcel Koller', 62, 70, 800000, 1),
(302, 'Jesualdo Ferreira', 76, 65, 700000, 2),
(303, 'Xavi Hernandez', 43, 75, 1000000, 3),
(304, 'Carlo Ancelotti', 64, 80, 1100000, 4),
(305, 'Jurgen Klopp', 56, 78, 1200000, 5),
(306, 'Erik ten Hag', 53, 74, 950000, 6),
(307, 'Stefano Pioli', 58, 72, 900000, 7),
(308, 'Simone Inzaghi', 47, 73, 870000, 8),
(309, 'Thomas Tuchel', 50, 79, 1150000, 9),
(310, 'Edin Terzic', 41, 68, 880000, 10),
(311, 'Jaime Pacheco', 64, 71, 600000, 11),
(312, 'Sabri Lamouchi', 52, 69, 590000, 12),
(313, 'Jose Luis Mendilibar', 62, 66, 850000, 13),
(314, 'Diego Simeone', 53, 77, 1050000, 14),
(315, 'Mauricio Pochettino', 51, 74, 1100000, 15),
(316, 'Mikel Arteta', 41, 76, 1020000, 16),
(317, 'Jose Mourinho', 61, 81, 1250000, 17),
(318, 'Rudi Garcia', 59, 70, 890000, 18),
(319, 'Marco Rose', 47, 67, 930000, 19),
(320, 'Oliver Glasner', 49, 75, 940000, 20);

-- Insert sample data into TEAM_TOURNAMENT table
INSERT INTO TEAM_TOURNAMENT (TEAM_ID, TEAM_NAME, TOURNAMENT_ID, TOURNAMENT_NAME) VALUES
(1, 'Al Ahly', 201, 'Egyptian Premier League'),
(1, 'Al Ahly', 202, 'Egypt Cup'),
(2, 'Zamalek', 201, 'Egyptian Premier League'),
(2, 'Zamalek', 202, 'Egypt Cup'),
(3, 'Barcelona', 203, 'La Liga'),
(3, 'Barcelona', 204, 'Spain Cup'),
(4, 'Real Madrid', 203, 'La Liga'),
(4, 'Real Madrid', 214, 'Copa del Rey'),
(5, 'Liverpool', 205, 'Premier League'),
(5, 'Liverpool', 206, 'FA Cup'),
(6, 'Manchester United', 205, 'Premier League'),
(6, 'Manchester United', 206, 'FA Cup'),
(7, 'AC Milan', 207, 'Serie A'),
(7, 'AC Milan', 208, 'Italy Cup'),
(8, 'Inter Milan', 207, 'Serie A'),
(8, 'Inter Milan', 208, 'Italy Cup'),
(9, 'Bayern Munich', 209, 'Bundesliga'),
(9, 'Bayern Munich', 219, 'DFB-Pokal'),
(10, 'Borussia Dortmund', 209, 'Bundesliga'),
(10, 'Borussia Dortmund', 219, 'DFB-Pokal'),
(11, 'Pyramids FC', 201, 'Egyptian Premier League'),
(11, 'Pyramids FC', 211, 'Egypt FA Cup'),
(12, 'Ismaily', 201, 'Egyptian Premier League'),
(12, 'Ismaily', 202, 'Egypt Cup'),
(13, 'Sevilla', 203, 'La Liga'),
(13, 'Sevilla', 214, 'Copa del Rey'),
(14, 'Atletico Madrid', 203, 'La Liga'),
(14, 'Atletico Madrid', 214, 'Copa del Rey'),
(15, 'Chelsea', 205, 'Premier League'),
(15, 'Chelsea', 206, 'FA Cup'),
(16, 'Arsenal', 205, 'Premier League'),
(16, 'Arsenal', 206, 'FA Cup'),
(17, 'AS Roma', 207, 'Serie A'),
(17, 'AS Roma', 217, 'Coppa Italia'),
(18, 'Napoli', 207, 'Serie A'),
(18, 'Napoli', 217, 'Coppa Italia'),
(19, 'RB Leipzig', 209, 'Bundesliga'),
(19, 'RB Leipzig', 220, 'Stuttgart Cup'),
(20, 'Eintracht Frankfurt', 209, 'Bundesliga'),
(20, 'Eintracht Frankfurt', 219, 'DFB-Pokal');

-- ========================================
-- Data Manipulation & Update Operations
-- ========================================

-- View all players
SELECT * FROM PLAYERS;

-- View player statistics
SELECT * FROM PLAYER_STATS;

-- Update operations demonstrating various SQL techniques

-- 1. Update a player's name
UPDATE PLAYERS 
SET PLAYER_NAME = 'wessam abou ali'
WHERE PLAYER_NUMBER = 102;

-- 2. Update a player's nation
UPDATE PLAYERS 
SET NATION = 'palestenian'
WHERE PLAYER_NUMBER = 102;

-- 3. Update another player's name
UPDATE PLAYERS
SET PLAYER_NAME = 'marco barella'
WHERE PLAYER_NUMBER = 108;

-- 4. Increment age for players older than 30
UPDATE PLAYERS
SET PLAYER_AGE = PLAYER_AGE + 1
WHERE PLAYER_AGE > 30;

-- 5. Update player's name based on pattern match
UPDATE PLAYERS
SET PLAYER_NAME = 'Marcos'
WHERE PLAYER_NAME LIKE '%Marco%';

-- 6. Set goals to 0 for players with a return date specified
UPDATE PLAYER_STATS
SET GOALS = 0
WHERE RETURN_DATE IS NOT NULL;

-- 7. Set age for players from England to 25 (example scenario)
UPDATE PLAYERS
SET PLAYER_AGE = 25
WHERE NATION = 'England';

-- 8. Increase coach salary for high win percentage coaches
UPDATE TECHNICAL_STAFF
SET COACH_SALARY = COACH_SALARY + 1000000
WHERE WIN_PERCENTAGE > 80;

-- 9. Update stadium for teams founded before 1700 (for demo purposes)
UPDATE TEAM
SET STADIUM = 'Historical Stadium'
WHERE YEAR_FOUNDED < 1700;

-- 10. Decrease coach age for coaches between 50 and 60 years old
UPDATE TECHNICAL_STAFF
SET COACH_AGE = COACH_AGE - 5
WHERE COACH_AGE BETWEEN 50 AND 60;

-- 11. Update TOP 5 PLAYER_STATS records setting position to 'forward' for players with more than 10 goals (SQL Server specific)
UPDATE TOP (5) PLAYER_STATS
SET POSITION = 'forward'
WHERE GOALS > 10;

-- ========================================
-- Data Analysis Queries
-- ========================================

-- A. Total Players by Nation
SELECT NATION, COUNT(*) AS Total_Players
FROM PLAYERS
GROUP BY NATION;

-- B. Aggregated Team Performance: Total Goals by Team
SELECT T.TEAM_NAME, SUM(PS.GOALS) AS Total_Goals
FROM TEAM T 
JOIN PLAYERS P ON T.TEAM_ID = P.TEAM_ID
JOIN PLAYER_STATS PS ON P.PLAYER_NUMBER = PS.PLAYER_NUMBER
GROUP BY T.TEAM_NAME;

-- C. Additional Analysis 1: Average Goals per Player by Team
SELECT T.TEAM_NAME, AVG(PS.GOALS) AS Average_Goals_Per_Player
FROM TEAM T 
JOIN PLAYERS P ON T.TEAM_ID = P.TEAM_ID
JOIN PLAYER_STATS PS ON P.PLAYER_NUMBER = PS.PLAYER_NUMBER
GROUP BY T.TEAM_NAME;

-- D. Additional Analysis 2: Top Scorer Overall
SELECT TOP 1 P.PLAYER_NAME, PS.GOALS AS Total_Goals
FROM PLAYERS P 
JOIN PLAYER_STATS PS ON P.PLAYER_NUMBER = PS.PLAYER_NUMBER
ORDER BY PS.GOALS DESC;

-- ========================================
-- Additional Complex Joins & Queries
-- ========================================

-- Example: Join between PLAYERS and TEAM to display player names with their teams (players aged 25 and above)
SELECT 
    P.PLAYER_NAME, 
    P.PLAYER_AGE, 
    T.TEAM_NAME
FROM PLAYERS P
JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
WHERE P.PLAYER_AGE >= 25;

-- Retrieve teams with stadium names containing 'Arena'
SELECT TEAM_NAME, STADIUM
FROM TEAM
WHERE STADIUM LIKE '%Arena%';

-- Retrieve players with goals between 10 and 20
SELECT P.PLAYER_NAME, PS.GOALS
FROM PLAYERS P 
JOIN PLAYER_STATS PS ON P.PLAYER_NUMBER = PS.PLAYER_NUMBER
WHERE PS.GOALS BETWEEN 10 AND 20;

-- Inner join between PLAYERS and TEAM
SELECT P.PLAYER_NAME, T.TEAM_NAME
FROM PLAYERS P
INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID;

-- Left join between PLAYER_STATS and PLAYERS
SELECT PS.PLAYER_NUMBER, P.PLAYER_NAME, PS.GOALS
FROM PLAYER_STATS PS
LEFT JOIN PLAYERS P ON PS.PLAYER_NUMBER = P.PLAYER_NUMBER;

-- Right join between TECHNICAL_STAFF and TEAM
SELECT TS.COACH_NAME, T.TEAM_NAME
FROM TECHNICAL_STAFF TS
RIGHT JOIN TEAM T ON TS.TEAM_ID = T.TEAM_ID;

-- Complex Multi-Table Join: Retrieve player, team, tournament, and coach details
SELECT 
    P.PLAYER_NAME, 
    PS.POSITION, 
    T.TEAM_NAME, 
    TS.COACH_NAME, 
    TN.TOURNAMENT_NAME
FROM PLAYER_STATS PS
INNER JOIN PLAYERS P ON PS.PLAYER_NUMBER = P.PLAYER_NUMBER
INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
INNER JOIN TEAM_TOURNAMENT TT ON T.TEAM_ID = TT.TEAM_ID
INNER JOIN TECHNICAL_STAFF TS ON T.TEAM_ID = TS.TEAM_ID
INNER JOIN TOURNAMENT TN ON TT.TOURNAMENT_ID = TN.TOURNAMENT_ID;

-- Full join between TEAM and TEAM_TOURNAMENT
SELECT T.TEAM_NAME, TT.TOURNAMENT_NAME
FROM TEAM T
FULL JOIN TEAM_TOURNAMENT TT ON T.TEAM_ID = TT.TEAM_ID;

-- Join among TEAM, TECHNICAL_STAFF, and TOURNAMENT
SELECT T.TEAM_NAME, TS.COACH_NAME, TT.TOURNAMENT_NAME
FROM TEAM T
JOIN TECHNICAL_STAFF TS ON T.TEAM_ID = TS.TEAM_ID
JOIN TEAM_TOURNAMENT TT ON T.TEAM_ID = TT.TEAM_ID;

-- Left join between TEAM_TOURNAMENT and TOURNAMENT with tournament place condition
SELECT TT.TEAM_NAME, TN.TOURNAMENT_NAME, TN.TOURNAMENT_PLACE
FROM TEAM_TOURNAMENT TT
LEFT JOIN TOURNAMENT TN ON TT.TOURNAMENT_ID = TN.TOURNAMENT_ID
WHERE TN.TOURNAMENT_PLACE = 'Spain';

-- Full join among TEAM, TECHNICAL_STAFF, and TEAM_TOURNAMENT
SELECT T.TEAM_NAME, TS.COACH_NAME, TT.TOURNAMENT_NAME
FROM TEAM T
FULL JOIN TECHNICAL_STAFF TS ON T.TEAM_ID = TS.TEAM_ID
FULL JOIN TEAM_TOURNAMENT TT ON T.TEAM_ID = TT.TEAM_ID;

-- ========================================
-- End of Script
-- ========================================
