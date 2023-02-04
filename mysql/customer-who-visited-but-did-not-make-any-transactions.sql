/*
Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the primary key for this table.
This table contains information about the customers who visited the mall.

Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is the primary key for this table.
This table contains information about the transactions made during the visit_id.

# Problem
Write a SQL query to find the IDs of the users who visited without making 
any transactions and the number of times they made these types of visits.
*/

SELECT customer_id
     , COUNT(visit_id) AS count_no_trans
  FROM (
        SELECT v.visit_id
             , transaction_id
             , customer_id
          FROM visits v
          LEFT JOIN transactions t
            ON t.visit_id = v.visit_id
         WHERE transaction_id IS NULL
       ) TEMP
GROUP BY customer_id