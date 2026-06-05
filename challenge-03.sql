with email_link_clicks as (
  SELECT userid, count(*) as num_link_clicks
  FROM frontendeventlog el
  WHERE eventid = 5
  GROUP BY userid
)

SELECT 
  num_link_clicks,
  count(*) as num_users
FROM email_link_clicks
GROUP BY num_link_clicks;
