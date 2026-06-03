<p>SELECT *<br>
FROM subscriptions;</p>

<p> ************************** </p>
<p>SELECT CustomerID, <br>
sum(NumberOfUsers) as total_users <br>
FROM subscriptions <br>
GROUP BY CustomerID;</p>

<p> ************************** </p>
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
