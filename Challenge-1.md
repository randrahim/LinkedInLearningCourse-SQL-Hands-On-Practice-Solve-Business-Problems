<p> *** Retrieve all subscription records from the subscriptions table. ***</p>
<p>SELECT *<br>
FROM subscriptions;</p>

<p> *** Calculate the total number of users for each customer. ***</p>
<p>SELECT CustomerID, <br>
sum(NumberOfUsers) as total_users <br>
FROM subscriptions <br>
GROUP BY CustomerID;</p>

<p> *** Calculate the total number of registered users for each customer across all subscriptions. ***</p>
<p>with num_users as (<br>
SELECT CustomerID,<br>
sum(NumberOfUsers) as total_users<br>
FROM subscriptions<br>
GROUP BY CustomerID;<br>
)</p>

<p>SELECT<br>
avg(total_users) as average_users<br>
FROM<br>
num_users;</p>
