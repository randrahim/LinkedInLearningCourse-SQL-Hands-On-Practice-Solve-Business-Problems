SELECT
  CustomerID,
  COUNT(productid) AS num_products,
  SUM(numberofusers) AS total_users,
  CASE
    WHEN COUNT(productid) = 1
      OR SUM(numberofusers) >= 5000
    THEN 1
    ELSE 0
  END AS upsell_opportunity
FROM subscriptions
GROUP BY CustomerID;