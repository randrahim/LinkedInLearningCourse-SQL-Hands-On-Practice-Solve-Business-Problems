SELECT *
FROM subscriptions s

JOIN products p
ON s.productid = p.productid

WHERE s.orderdate between '2022-01-01' and '2022-12-31'
