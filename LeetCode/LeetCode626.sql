-----------------------------------------------------------------------
-- 	LeetCode 626. Exchange Seats
--
-- 	Medium
--
-- 	SQL Schema
--
-- 	Mary is a teacher in a middle school and she has a table seat storing 
--  students' names and their corresponding seat ids.
--  The column id is continuous increment. 
-- 
--  Mary wants to change seats for the adjacent students. 
-- 
--  Can you write a SQL query to output the result for Mary? 
-- 
--  +---------+---------+
--  |    id   | student |
--  +---------+---------+
--  |    1    | Abbot   |
--  |    2    | Doris   |
--  |    3    | Emerson |
--  |    4    | Green   |
--  |    5    | Jeames  |
--  +---------+---------+
--  For the sample input, the output is: 
--
--  +---------+---------+
--  |    id   | student |
--  +---------+---------+
--  |    1    | Doris   |
--  |    2    | Abbot   |
--  |    3    | Green   |
--  |    4    | Emerson |
--  |    5    | Jeames  |
--  +---------+---------+
--  Note:
--  If the number of students is odd, there is no need to change 
--  the last one's seat.
--
------------------------------------------------------------------------
/* Write your T-SQL query statement below */
SELECT
    A.id,
    CASE WHEN B.student IS NULL THEN A.student ELSE B.student END AS student
FROM 
    seat AS A
LEFT JOIN
    seat AS B
ON 
    (A.id % 2 = 1 AND A.id + 1 = B.id) OR
    (A.id % 2 = 0 AND A.id - 1 = B.id)
;