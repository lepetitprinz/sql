/*
Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature on a certain day.

# Problem
Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
*/

SELECT id
  FROM weather w1
 INNER JOIN (
             SELECT DATE_ADD(recordDate, INTERVAL 1 DAY) AS recordDate
                  , temperature AS bfTemp
               FROM weather
            ) w2
    ON w1.recordDate = w2.recordDate
 WHERE temperature > bfTemp