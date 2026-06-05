WITH monthly_revs AS (
  SELECT
    p.productname,
    EXTRACT(MONTH FROM s.orderdate) AS order_month,
    SUM(s.revenue) AS revenue
  FROM subscriptions s
  JOIN products p
    ON s.productid = p.productid
  WHERE s.orderdate >= '2022-01-01'
    AND s.orderdate < '2023-01-01'
  GROUP BY
    p.productname,
    EXTRACT(MONTH FROM s.orderdate)
)

SELECT
  productname,
  MIN(revenue) AS min_rev,
  MAX(revenue) AS max_rev,
  AVG(revenue) AS avg_rev,
  STDDEV(revenue) AS std_dev_rev
FROM monthly_revs
GROUP BY productname;