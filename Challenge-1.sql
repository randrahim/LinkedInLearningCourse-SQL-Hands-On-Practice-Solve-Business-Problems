-- Retrieve all subscription records from the subscriptions table.
SELECT *
FROM subscriptions;

-- Calculate the total number of users for each customer.
SELECT CustomerID,
  sum(NumberOfUsers) as total_users
FROM subscriptions
GROUP BY CustomerID;

-- Calculate the total number of registered users for each customer across all subscriptions.
with num_users as (
  SELECT CustomerID,
  sum(NumberOfUsers) as total_users
FROM subscriptions
  GROUP BY CustomerID;
)

SELECT avg(total_users) as average_users
FROM num_users;
