with monthly_revs as (
SELECT *
FROM subscriptions s

JOIN products p
ON s.productid = p.productid

WHERE s.orderdate between '2022-01-01' and '2022-12-31'

GROUP BY 
  date_trunc('month', s.orderdate), p.productname
)

SELECT 
  productname,
  min(revenue) as min_rev,
  max(revenue) as max_rev,
  avg(revenue) as avg_rev,
  stddev(revenue) as std_dev_rev
FROM 
  monthly_revs
GROUP BY 
  productname;