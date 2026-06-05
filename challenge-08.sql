with all_cancelation_reasons as (
  SELECT subscriptionid, 
         cancelationreason1 as cancelationreason
  FROM cancelations 

  UNION

  SELECT subscriptionid, 
         cancelationreason2 as cancelationreason
  FROM cancelations 

  UNION

  SELECT subscriptionid, 
         cancelationreason3 as cancelationreason
  FROM cancelations 
)

SELECT 
    cast(count(
      case when cancelationreason = 'Expensive'
      then subscriptionid end) as float)
FROM all_cancelation_reasons;