With all_subscriptions as(
  SELECT subscriptionid,
         expirationdate
  FROM subscriptionsproduct1
  WHERE active = 1

  UNION ALL 
  
  SELECT subscriptionid,
         expirationdate
  FROM subscriptionsproduct2
  WHERE active = 1
)

SELECT
	date_trunc('year', expirationdate) as exp_year, 
	count(*) as subscriptions
FROM
	all_subscriptions
GROUP BY 
	date_trunc('year', expirationdate)