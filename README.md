# database-project-sql-
An SQL project completed as part of my college database coursework.
# Yalla Kora Database Project

## Overview
**Yalla Kora** is a comprehensive SQL Server database project designed to manage and analyze data for a soccer (football) management system. It includes details about teams, players, player statistics, tournaments, and technical staff. The project demonstrates a solid understanding of relational database design, data manipulation, and advanced SQL querying.

## Features
- **Robust Schema Design:**  
  - Tables for `TEAM`, `PLAYERS`, `PLAYER_STATS`, `TOURNAMENT`, `TECHNICAL_STAFF`, and `TEAM_TOURNAMENT`.
  - Well-defined relationships with primary and foreign key constraints.
- **Sample Data Insertion:**  
  - Realistic data for teams, players, tournaments, and technical staff.
- **Data Manipulation:**  
  - Update queries showcasing various SQL techniques.
- **Complex Queries & Joins:**  
  - Examples of inner, left, right, and full joins.
  - Aggregation, grouping, and filtering queries.
- **Data Analysis Examples:**  
  - Queries to calculate averages, totals, and team performance metrics.

## Project Structure
- **Yalla_Kora.sql:**  
  The main SQL script containing:
  - Database and table creation.
  - Sample data insertion.
  - Update operations and complex queries.
  - Inline comments to explain each section.
- **README.md:**  
  This document explaining the project purpose, structure, and usage instructions.

## Getting Started

### Prerequisites
- **SQL Server Management Studio (SSMS)** or another SQL Server client.
- Basic knowledge of SQL.

### How to Run
1. Open your SQL Server client.
2. Execute the `Yalla_Kora.sql` script to create the database, insert sample data, and run queries.
3. Explore the sample analysis queries to see insights drawn from the data.

## Schema Details

### Tables
- **TEAM:** Stores team details (ID, name, stadium, and foundation year).
- **PLAYERS:** Stores player details and associates each player with a team.
- **PLAYER_STATS:** Contains player performance statistics like goals, assists, and position.
- **TOURNAMENT:** Stores tournament information.
- **TECHNICAL_STAFF:** Contains details about coaching staff.
- **TEAM_TOURNAMENT:** Junction table linking teams with the tournaments in which they participate.

## Sample Data Analysis Queries

- **Average Age of Players:**
  ```sql
  SELECT AVG(PLAYER_AGE) AS Average_Age FROM PLAYERS;
