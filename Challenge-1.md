<p>SELECT *</p>
<p>FROM subscriptions;</p>

<p>SELECT CustomerID,</p>
<p>sum(NumberOfUsers) as total_users</p>
<p>FROM subscriptions</p>
<p>GROUP BY CustomerID;</p>

<p>with num_users as (</p>
<p>SELECT CustomerID,</p>
<p>sum(NumberOfUsers) as total_users</P>
<p>FROM subscriptions</p>
<p>GROUP BY CustomerID;</p>
<p>)</p>

<p>SELECT</p>
<p>avg(total_users) as average_users</p>
<p>FROM</p>
<p>num_users;</p>
