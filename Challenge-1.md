SELECT \*
FROM subscriptions;

SELECT CustomerID,
sum(NumberOfUsers) as total_users
FROM subscriptions
GROUP BY CustomerID;
