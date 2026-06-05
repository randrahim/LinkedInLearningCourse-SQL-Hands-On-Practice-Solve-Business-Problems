SELECT 
    userid,
    sum(case when el.eventid = 1 then 1 else 0 end) as ViewedHelpCenterPage,
    case when el.eventid = 2 then 1 else 0 end as ClickedFAQs,
    case when el.eventid = 3 then 1 else 0 end as ClickedContactSupport,
    case when el.eventid = 4 then 1 else 0 end as SubmittedTicket,
FROM frontendeventlog el
JOIN frontendeventdefinitions def
  ON el.eventid = def.eventid
WHERE eventtype = 'Customer Support'
GROUP BY userid
   