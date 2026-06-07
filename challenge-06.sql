SELECT 
  el.userid,
  SUM(CASE WHEN el.eventid = 1 THEN 1 ELSE 0 END) AS ViewedHelpCenterPage,
  SUM(CASE WHEN el.eventid = 2 THEN 1 ELSE 0 END) AS ClickedFAQs,
  SUM(CASE WHEN el.eventid = 3 THEN 1 ELSE 0 END) AS ClickedContactSupport,
  SUM(CASE WHEN el.eventid = 4 THEN 1 ELSE 0 END) AS SubmittedTicket
FROM frontendeventlog el
JOIN frontendeventdefinitions def
  ON el.eventid = def.eventid
WHERE def.eventtype = 'Customer Support'
GROUP BY el.userid;