SELECT * <br>
FROM subscriptions;

SELECT CustomerID, <br>
sum(NumberOfUsers) as total_users <br>
FROM subscriptions <br>
GROUP BY CustomerID;
