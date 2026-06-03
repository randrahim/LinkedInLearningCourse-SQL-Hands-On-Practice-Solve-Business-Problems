<p><b>*** Retrieve all subscription records from the subscriptions table. ***</b></p>
<p>SELECT *<br>
FROM subscriptions;</p>

<p><b>*** Calculate the total number of users for each customer. ***</b></p>
<p>SELECT CustomerID, <br>
sum(NumberOfUsers) as total_users <br>
FROM subscriptions <br>
GROUP BY CustomerID;</p>

<p><b>*** Calculate the total number of registered users for each customer across all subscriptions. ***</b></p>
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
